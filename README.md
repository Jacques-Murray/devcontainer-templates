# WordPress + MySQL Devcontainer Template

## Project Overview and Purpose

This project provides a modular, reusable [VS Code Devcontainer](https://code.visualstudio.com/docs/devcontainers/containers) template for rapid WordPress + MySQL development. It includes built-in support for Xdebug, WP-CLI, and optional Node.js, enabling a robust local development environment with minimal setup.

---

## Setup Instructions

### Prerequisites

- [Docker](https://www.docker.com/get-started) and [Docker Compose](https://docs.docker.com/compose/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- (Recommended) [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode), [PHP Intelephense](https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client), [PHP Debug](https://marketplace.visualstudio.com/items?itemName=xdebug.php-debug)

### Environment Variables

The devcontainer relies on several environment variables for configuration. Create a `.env` file in `src/wordpress-mysql/.devcontainer/` with the following variables:

```env
# MySQL Database Configuration
DB_NAME=wordpress
DB_USER=wordpress
DB_PASSWORD=wordpress
DB_ROOT_PASSWORD=wordpress
DB_HOST=db

# WordPress Configuration
WORDPRESS_DB_HOST=db:3306
WORDPRESS_DB_USER=wordpress
WORDPRESS_DB_PASSWORD=wordpress
WORDPRESS_DB_NAME=wordpress
```

> **Note:** No `.env.example` is provided. It is recommended to create one for onboarding.

### Initial Setup

1. Clone this repository.
2. Copy or create your `.env` file as described above.
3. Open the project in VS Code.
4. When prompted, **Reopen in Container** (or use the Command Palette: "Dev Containers: Reopen in Container").
5. The devcontainer will build and start WordPress and MySQL services.

---

## Usage Details

### Starting the Devcontainer

- The devcontainer will automatically build and start the necessary services using Docker Compose.
- WordPress will be available at [http://localhost:8000](http://localhost:8000) (consider exposing port 80 as well for flexibility).

### Development Workflow

- **Themes/Plugins:**  
  The `wp-content` directory is mapped for development. Place your custom themes and plugins here.
  > **Caveat:** The volume mapping for `wp-content` should be reviewed. By default, it may map the entire project root, which can overwrite core files. Adjust to map only the `wp-content` directory as needed.

- **WP-CLI:**  
  WP-CLI is installed and available in the container for managing WordPress from the command line.

- **Node.js (Optional):**  
  Node.js can be installed by setting the appropriate build argument. Useful for theme/plugin development requiring Node tooling.

### Debugging

- **Xdebug:**  
  Xdebug is pre-configured for remote debugging. The default `client_host` is `host.docker.internal`, which works on most platforms.
  > **Linux Caveat:** On Linux without Docker Desktop, `host.docker.internal` may not resolve. Use your host's IP address or configure accordingly.

- **VS Code Debugging:**  
  Use the PHP Debug extension and launch a debug session to set breakpoints and inspect code.

### Common Commands

- **Post-Create Command:**  
  The container runs a command to fix permissions on `wp-content`. If the directory does not exist, consider creating it or making the command conditional.

---

## Code Structure

```
.
├── README.md
├── .github/                # GitHub configuration (actions, templates, etc.)
└── src/
    └── wordpress-mysql/
        ├── devcontainer-template.json   # Template metadata and options
        └── .devcontainer/
            ├── devcontainer.json        # Main devcontainer config
            ├── docker-compose.yml       # Multi-service orchestration (WordPress, MySQL)
            ├── Dockerfile               # Custom image build (Xdebug, WP-CLI, Node.js)
            └── xdebug.ini               # Xdebug configuration
```

- **devcontainer-template.json:**  
  Defines template metadata, options (PHP version, Node.js), and documentation links.

- **devcontainer.json:**  
  Main configuration for VS Code Dev Containers, specifying services, extensions, workspace folder, and post-create commands.

- **docker-compose.yml:**  
  Orchestrates WordPress and MySQL containers, sets up environment variables, and volume mappings.

- **Dockerfile:**  
  Builds the WordPress image, installs Xdebug, WP-CLI, and optionally Node.js.  
  > **Note:** The Bash conditional for Node.js installation should be:  
  `if [ "${INSTALL_NODE}" = "true" ]; then ... fi`

- **xdebug.ini:**  
  Configures Xdebug for remote debugging.

---

## Key Features and Benefits

- **Modular, reusable devcontainer template**
- **Rapid local WordPress + MySQL development**
- **Pre-configured Xdebug for PHP debugging**
- **WP-CLI for command-line management**
- **Optional Node.js support for modern workflows**
- **Best-practice Docker and VS Code configuration**
- **Easy onboarding for new developers**

---

## Notable Recommendations and Caveats

- **Environment Variables:**  
  All required variables must be set in `.env`. Document or provide a `.env.example` for onboarding.

- **Volume Mapping:**  
  Review and adjust the `wp-content` volume mapping in `docker-compose.yml` to avoid overwriting core files.

- **host.docker.internal:**  
  May not work on Linux without Docker Desktop. Document alternatives for debugging.

- **Permissions:**  
  The post-create command fixes permissions on `wp-content`. Ensure this directory exists or make the command robust.

- **Healthchecks:**  
  Consider adding healthchecks for both `db` and `wordpress` services in `docker-compose.yml` for improved reliability.

- **Comments and Documentation:**  
  Add comments in `docker-compose.yml` and `Dockerfile` for clarity.

---

## Onboarding Tips for New Contributors

- **Getting Started:**  
  Follow the setup instructions above. If you encounter issues, check Docker, environment variables, and permissions.

- **Understanding the Structure:**  
  Each template lives in its own subdirectory under `src/`. The `wordpress-mysql` template is a reference for modular, extensible devcontainer setups.

- **Contributing:**  
  - Add or update documentation as needed.
  - Follow best practices for Docker, VS Code, and WordPress development.
  - Test changes in a fresh container to ensure reliability.

- **Support:**  
  For questions or issues, open an issue or consult the documentation links in `devcontainer-template.json`.

---

## License

[MIT](LICENSE) (or specify your license here)
