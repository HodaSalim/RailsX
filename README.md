# RailsX

RailsX is a web application built using Ruby on Rails. It is based on the tutorial from **Michael Hartl's Ruby on Rails Tutorial**, which teaches web development and Rails best practices through the creation of a Twitter-like social media application.

## Features

- **User Authentication**: Sign up, login, and logout functionality with secure password encryption.
- **User Profiles**: Each user has a profile page displaying their posts.
- **Microposts**: Users can create, view, and delete microposts (short messages, similar to tweets).
- **Following System**: Users can follow and unfollow other users, creating a social network.
- **Feed**: Displays microposts from the user and those they are following.
- **Responsive Design**: Utilizes Bootstrap to ensure the site looks great on all devices.
- **Testing**: Comprehensive test suite using MiniTest for integration and unit tests.

## Technologies Used

- **Ruby on Rails**: A web application framework.
- **MySQL**: Database for storing users, microposts, and relationships.
- **Bootstrap**: Front-end framework for responsive design.

## Getting Started

To get a local copy of the project running on your machine, follow these steps.

### Prerequisites

Make sure you have the following installed:

- Ruby (version 3.0+)
- Rails (version 7.0+)
- MySQL
- Git

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/HodaSalim/railsx.git
   cd railsx
   ```

2. **Install Gems**:

   ```bash
   bundle install
   ```

3. **Set up the database**:

   If you're using PostgreSQL:

   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Seed the database**:

   This will create the sample users, posts, and relationships:

   ```bash
   rails db:seed
   ```

5. **Start the Rails server**:

   ```bash
   rails server
   ```

6. **Access the app**:

   Open a browser and go to `http://localhost:5000`.

### Running Tests

RailsX has a comprehensive test suite using MiniTest. To run the tests, simply use the following command:

```bash
rails test
```

This will run all the unit and integration tests to ensure that the application behaves as expected.

## Contributing

If you'd like to contribute to RailsX, feel free to fork the repository and submit a pull request.

1. Fork the project
2. Create a feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m 'Add YourFeature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a pull request

## License

RailsX is open-source software licensed under the [MIT license](LICENSE).


