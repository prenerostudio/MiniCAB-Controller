<?php
include 'config.php';
$apiKey = 'AIzaSyBkPNpPhCg1hVZ14GUWeGpxpSaIL-qPdbU'; // Replace with your actual API key

// List of postal zones
$zones = ['EN1', 'EN2', 'EN3', 'EN4', 'EN5', 'EN6', 'EN7', 'EN8', 'EN9', 'EN10', 'EN11', 'CM0', 'CM1', 'CM2', 'CM3', 'CM4', 'CM5', 'CM6', 'CM7', 'CM8', 'CM9', 'CM11', 'CM12', 'CM13', 'CM14', 'CM15', 'CM16', 'CM17', 'CM18', 'CM19', 'CM20', 'CM21', 'CM22', 'CM23', 'CM24', 'CM77', 'CM92', 'CM98', 'CM99', 'BR1', 'BR2', 'BR3', 'BR4', 'BR5', 'BR6', 'BR7', 'BR8', 'WD3', 'WD4', 'WD5', 'WD6', 'WD7', 'WD17', 'WD18', 'WD19', 'WD23', 'WD24', 'WD25', 'WD99', 'IG1', 'IG2', 'IG3', 'IG4', 'IG5', 'IG6', 'IG7', 'IG8', 'IG9', 'IG10', 'IG11', 'HA0', 'HA1', 'HA2', 'HA3', 'HA4', 'HA5', 'HA6', 'HA7', 'HA8', 'HA9', 'UB1', 'UB2', 'UB3', 'UB3', 'UB4', 'UB5', 'UB5', 'UB6', 'UB7', 'UB8', 'UB8', 'UB9', 'UB10', 'UB11', 'UB18', 'RM1', 'RM2', 'RM3', 'RM4', 'RM5', 'RM6', 'RM7', 'RM8', 'RM9', 'RM10', 'RM11', 'RM12', 'RM13', 'RM14', 'RM15', 'RM16', 'RM17', 'RM18', 'RM19', 'RM20', 'TW1', 'TW2', 'TW3', 'TW4', 'TW5', 'TW6', 'TW7', 'TW8', 'TW9', 'TW10', 'TW11', 'TW12', 'TW13', 'TW14', 'TW15', 'TW16', 'TW17', 'TW18', 'TW19', 'TW20', 'DA1', 'DA2', 'DA3', 'DA4', 'DA5', 'DA6', 'DA7', 'DA8', 'DA9', 'DA10', 'DA11', 'DA12', 'DA13', 'DA14', 'DA15', 'DA16', 'DA17', 'DA18', 'CR0', 'CR2', 'CR3', 'CR4', 'CR5', 'CR6', 'CR7', 'CR8', 'CR9', 'CR44', 'CR90', 'KT1', 'KT2', 'KT3', 'KT4', 'KT5', 'KT6', 'KT7', 'KT8', 'KT9', 'KT10', 'KT11', 'KT12', 'KT13', 'KT14', 'KT15', 'KT16', 'KT17', 'KT18', 'KT19', 'KT20', 'KT21', 'KT22', 'KT23', 'KT24', 'SM1', 'SM2', 'SM3', 'SM4', 'SM5', 'SM6', 'SM7'];

// Function to get lat/lng bounds
function getZoneBounds($zone, $apiKey) {
    $url = "https://maps.googleapis.com/maps/api/geocode/json?address=" . urlencode($zone . ',UK') . "&key=$apiKey";
    $response = file_get_contents($url);
    $data = json_decode($response, true);

    if ($data['status'] === 'OK') {
        $bounds = $data['results'][0]['geometry']['bounds'] ?? $data['results'][0]['geometry']['viewport'];
        return [
            'zone'    => $zone,
            'lat_min' => $bounds['southwest']['lat'],
            'lat_max' => $bounds['northeast']['lat'],
            'lng_min' => $bounds['southwest']['lng'],
            'lng_max' => $bounds['northeast']['lng']
        ];
    } else {
        return [
            'zone'  => $zone,
            'error' => $data['status']
        ];
    }
}

// Insert data into the database
foreach ($zones as $zone) {
    $bounds = getZoneBounds($zone, $apiKey);

    if (isset($bounds['error'])) {
        echo "Error for zone {$bounds['zone']}: {$bounds['error']}<br>";
    } else {
        $stmt = $connect->prepare("INSERT INTO `zones`(`zone_name`, `lat_min`, `lat_max`, `lng_min`, `lng_max`) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sdddd", $bounds['zone'], $bounds['lat_min'], $bounds['lat_max'], $bounds['lng_min'], $bounds['lng_max']);

        if ($stmt->execute()) {
            echo "Zone {$bounds['zone']} inserted successfully.<br>";
        } else {
            echo "Error inserting zone {$bounds['zone']}: " . $stmt->error . "<br>";
        }

        $stmt->close();
    }
    sleep(1); // Prevent API rate limit issues
}

$connect->close();
?>
