# MiniCAB Controller

## Overview

MiniCAB Controller is a PHP-based web application designed to serve as the backend for the MiniCAB suite of mobile applications. This application manages ride bookings, user authentication, payment processing, and other essential backend functionalities. It provides RESTful APIs for the MiniCAB Driver, Customer, and Booker apps to interact with.

## Features

- **User Management**: Handle registration, login, and profile management for drivers, customers, and booking agents.
- **Booking Management**: Create, update, and manage ride bookings.
- **Customer Management**: Create, update, and manage customer profiles.
- **Booker Management**: Create, update, and manage booker profiles.
- **Driver Management**: Create, update, and manage driver profiles.
- **Company Management**: Create, update, and manage company profiles.
- **Payment Processing**: Manage payment transactions and track earnings.
- **Ride Tracking**: Monitor and update the status of rides in real-time.
- **Notification System**: Send notifications to users about ride statuses and other updates.
- **Support System**: Handle customer and driver support queries.

## Installation

To get started with the MiniCAB Controller, follow these steps:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/prenerostudio/MiniCAB-Controller.git
   cd MiniCAB-Controller
   ```

2. **Install dependencies:**

   Make sure you have a server installed like XAMPP or WAMP.

3. **Configure the environment:**

   Copy the MiniCAB Controller folder to `c:/xampp/htdocs/`

4. **Run migrations:**

   Create and import the database in phpMyAdmin.

5. **Start the server:**

   Start the local development server through XAMPP or WAMP.

## Project Structure

Here's a brief overview of the project structure:

```
MiniCAB-Controller/
├── api/
│   ├── driver/
│   ├── booker/
├── css/
├── db/
├── driver-signup/
├── img/
├── js/
├── libs/
├── static/
├── vendor/
├── accept-bid.php
├── accepted-bids.php
├── activate-company.php
├── activate-driver.php
├── activity_log.php
├── add-bid.php
├── add-booking.php
├── add-driver-bank.php
├── add-vehicle.php
├── airport-process.php
├── airports.php
├── all-bookings.php
├── all-users.php
├── approve-driver-delete.php
├── approve-fares.php
├── bid-bookings.php
├── bid-process.php
├── bids-details.php
├── block-company.php
├── blocked-companies.php
├── booker-invoice.php
├── booker-process.php
├── booker-report-result.php
├── booker-report.php
├── bookers.php
├── booking-history.php
├── booking-process.php
├── cancel-booking.php
├── cancel-driver-delete.php
├── cancelled-booking.php
├── chat_messages.php
├── close-bid.php
├── companies.php
├── company-process.php
├── company.php
├── completed-booking.php
├── config.php
├── correction-details.php
├── count-active-companies.php
├── count-active-drivers.php
├── count-airports.php
├── count-all-bookings.php
├── count-block-company.php
├── count-bookers.php
├── count-cancelled.php
├── count-completed.php
├── count-customers.php
├── count-dest.php
├── count-inactive-drivers.php
├── count-inprocess.php
├── count-new-drivers.php
├── count-rs.php
├── count-upcoming-booking.php
├── count-zones.php
├── customer-activity-log.php
├── customer-process.php
├── customer-report-result.php
├── customer-report.php
├── customers.php
├── dashboard.php
├── date-process.php
├── db_process.php
├── del-airport.php
├── del-booker-img.php
├── del-company-img.php
├── del-company.php
├── del-customer-img.php
├── del-customer.php
├── del-date.php
├── del-destination.php
├── del-driver-bank.php
├── del-driver-img.php
├── del-driver.php
├── del-mg.php
├── del-peak-hours.php
├── del-price-by-mile.php
├── del-price-postcode.php
├── del-user-img.php
├── del-vehicle-img.php
├── del-vehicle.php
├── del-zone.php
├── destination-process.php
├── destinations.php
├── dispatch-booking.php
├── dispatch-process.php
├── driver-activity-logs.php
├── driver-bank-section.php
├── driver-booking-statement-section.php
├── driver-delete-request.php
├── driver-details-section.php
├── driver-document-section.php
├── driver-process.php
├── driver-report-result.php
├── driver-reports.php
├── driver-tracker.php
├── driver-vehicle-document-section.php
├── driver-vehicle-section.php
├── drivers.php
├── dv_process.php
├── edit-driver-bank.php
├── edit-mg.php
├── edit-postcode-price.php
├── fare-corrections.php
├── fare-count.php
├── fetch-cancelled-booking.php
├── fetch-completed-booking.php
├── fetch-next-data.php
├── fetch_data.php
├── footer.php
├── functions.php
├── get-driver-details.php
├── get_clients.php
├── get_customer_details.php
├── get_vehicle_pricing.php
├── header.php
├── inactive-drivers.php
├── inbox.php
├── index.php
├── inprocess-bookings.php
├── invoice.php
├── job-history.php
├── logout.php
├── make-inactive.php
├── meet-greet-price.php
├── mg_process.php
├── mp_process.php
├── navbar.php
├── new-driver-web.php
├── new-drivers-count.php
├── new-drivers.php
├── open-bid.php
├── payments.php
├── pbl-process.php
├── peak-hours-price.php
├── peak-hours-process.php
├── postcode-price.php
├── pp_process.php
├── price-by-location.php
├── price-by-mile.php
├── pricing.php
├── profile-setting.php
├── railway_stations.php
├── railyway-process.php
├── retrieve_user_locations.php
├── send_message.php
├── session.php
├── special-date-price.php
├── special-dates.php
├── time-slot-process.php
├── time-slots.php
├── upcoming-bookings.php
├── update-booker-img.php
├── update-booker-status.php
├── update-booker.php
├── update-booking.php
├── update-company-img.php
├── update-company-status.php
├── update-company.php
├── update-customer-img.php
├── update-customer-status.php
├── update-customer.php
├── update-driver-bank.php
├── update-driver-img.php
├── update-driver-status.php
├── update-driver.php
├── update-dv.php
├── update-fares.php
├── update-logo.php
├── update-mg.php
├── update-postcode-price.php
├── update-user-img.php
├── update-user.php
├── update-vehicle-img.php
├── update-vehicles.php
├── update_account_status.php
├── update_driver_list.php
├── update_driver_list_pob.php
├── update_job_list.php
├── upload-back-pic.php
├── upload-back.php
├── upload-dvla.php
├── upload-extra.php
├── upload-front-pic.php
├── upload-front.php
├── upload-log-book.php
├── upload-mot.php
├── upload-ni.php
├── upload-pa1.php
├── upload-pa2.php
├── upload-pco.php
├── upload-rental-agreement.php
├── upload-road-tax.php
├── upload-schedule.php
├── upload-vinsurance.php
├── upload-vpco.php
├── user-process.php
├── user_list.php
├── vehicle-details.php
├── vehicle-extra.php
├── vehicle-process.php
├── vehicles.php
├── view-account.php
├── view-booker.php
├── view-booking.php
├── view-company.php
├── view-customer.php
├── view-driver.php
├── view-user.php
├── view-vehicle.php
├── web-driver-count.php
├── withdraw-job.php
├── zone-process.php
└── zones.php
```

## Contributing

We welcome contributions! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature/YourFeature`).
6. Create a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Contact

If you have any questions or suggestions, feel free to reach out to us at hello@prenero.com
