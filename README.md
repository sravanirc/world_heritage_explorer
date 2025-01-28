# World Heritage Explorer

A Phoenix LiveView application that provides an interactive exploration of UNESCO World Heritage Sites around the globe.

## Features

- Dynamic data table of World Heritage Sites
- Real-time filtering by region
- Adjustable page size (10, 30, 50, 100 rows)
- Responsive pagination
- Detailed site information including:
  - Name and description
  - Geographic coordinates
  - Date inscribed
  - Area in hectares
  - Category
  - Region
  - ISO codes

## Getting Started

1. Set up your development environment:

    ```bash
    mix setup
    ```

2. Start the Phoenix server:

    ```bash
    mix phx.server
    ```

3. Visit `localhost:4000` in your browser.

## Technology Stack

- Elixir/Phoenix
- Phoenix LiveView
- Flop for pagination and filtering
- TailwindCSS for styling
- PostgreSQL database

## Development

The application uses:

- LiveView for real-time updates
- Flop configuration for table styling and pagination
- World Heritage Sites data model
- Filter components for data exploration

## Contributing

- Fork the repository
- Create your feature branch
- Submit a pull request

## License

This project is open source and available under the MIT License.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
