# Maid Hiring Platform

A location-based maid hiring web application built with Ruby on Rails and Tailwind CSS. The platform connects clients with nearby maids, allowing them to schedule services, send booking offers, and exchange ratings after job completion.

## Features

### For Clients
- Search for maids within a specified radius (e.g., 20km or 50km)
- View maid profiles and hourly rates
- Send service requests for a future date
- Get notified when a maid accepts or rejects the offer
- Mark jobs as completed and leave a rating and feedback

### For Maids
- Sign up and create a service profile with location, hourly rate, and description
- Receive and manage booking offers
- Accept or reject incoming service requests
- View completed jobs and rate clients

## Tech Stack

- Ruby on Rails
- Tailwind CSS
- SQLite (development)
- Geocoder gem (OpenStreetMap API by default)
- Custom-built authentication system (no Devise)

## Setup Instructions

```bash
git clone https://github.com/zeehn/final-year-project.git
cd final-year-project
bundle install
rails db:create db:migrate
rails server
```

Then visit http://localhost:3000 in your browser.





