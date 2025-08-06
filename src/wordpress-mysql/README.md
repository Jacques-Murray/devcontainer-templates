# WordPress & MySQL DevContainer Template

## Project Overview

This DevContainer template provides a ready-to-use development environment for WordPress with a MySQL database, WP-CLI, and Xdebug. It is designed for developers who want a fast, reproducible, and isolated workspace for building, testing, and maintaining WordPress sites or plugins. The template is structured for clarity and ease of use, with user-friendly configuration options.

**Strengths:**
- Clear and well-organized structure.
- User-friendly options for customizing PHP version and Node.js installation.
- Designed for rapid onboarding and consistent development environments.

**Limitation:**  
The contents of the `.devcontainer/` directory are not available for documentation. As a result, this README cannot provide detailed information about scripts or files that may exist within `.devcontainer/`.

---

## Installation Instructions

1. **Prerequisites:**
   - [Docker](https://www.docker.com/get-started) installed and running.
   - [Visual Studio Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) (or any compatible devcontainer environment).

2. **Using this template:**
   - Copy or reference the `src/wordpress-mysql` template directory into your project.
   - Open the project folder in VS Code.
   - When prompted, **Reopen in Container** or use the Command Palette:  
     `Dev Containers: Reopen in Container`

---

## Configuration

The template supports the following options, which can be set in your `devcontainer.json` or via the template's configuration UI:

### `imageVariant` (string)
- **Description:** Select the PHP version for the WordPress image.
- **Options:**
  - `latest` (default): Uses the latest available PHP version.
  - `php8.2`: Uses PHP 8.2.
  - `php8.1`: Uses PHP 8.1.
- **Example:**
  ```json
  "imageVariant": "php8.2"
  ```

### `installNode` (boolean)
- **Description:** Install Node.js and npm for theme or plugin development.
- **Default:** `false`
- **Example:**
  ```json
  "installNode": true
  ```

---

## Usage Examples

### Launching the DevContainer

1. Open your project in VS Code.
2. If not already prompted, open the Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P`) and run:
   ```
   Dev Containers: Reopen in Container
   ```
3. The environment will build and start WordPress with MySQL, WP-CLI, and (optionally) Node.js.

### Common Workflows

- **Access WordPress:**  
  Once the container is running, access your local WordPress site at [http://localhost:8080](http://localhost:8080) (or the port specified in your configuration).

- **Using WP-CLI:**  
  Run WP-CLI commands directly in the container terminal, e.g.:
  ```
  wp plugin list
  ```

- **Developing Themes/Plugins:**  
  If `installNode` is enabled, use `npm` or `yarn` for front-end development.

---

## API Reference

This template does **not** provide additional scripts, commands, or HTTP endpoints beyond the standard WordPress, MySQL, and WP-CLI tools included in the container.  
Refer to the [WordPress documentation](https://wordpress.org/support/article/wordpress-features/) and [WP-CLI documentation](https://developer.wordpress.org/cli/commands/) for usage details.

---

## Notes for Contributors & Maintainers

- **Contributing:**  
  Contributions are welcome! Please open issues or pull requests via the [GitHub repository](https://github.com/Jacques-Murray/devcontainer-templates).

- **Reporting Issues:**  
  Use the GitHub Issues page to report bugs or suggest improvements.

- **Maintaining the Template:**  
  - Ensure changes maintain clarity and user-friendliness.
  - Update documentation and configuration options as needed.
  - Note: `.devcontainer/` contents are not documented here due to access limitations.

---

## Troubleshooting & FAQ

**Q: The container fails to build or WordPress is not accessible.**  
A: Ensure Docker is running and ports are not in use. Rebuild the container if necessary.

**Q: How do I change the PHP version?**  
A: Set the `imageVariant` option in your configuration (see above).

**Q: Node.js is not available.**  
A: Set `"installNode": true` in your configuration to enable Node.js and npm.

**Q: Where can I find more documentation?**  
A: See the links below.

---

## License and Documentation Links

- **Documentation:**  
  [https://github.com/Jacques-Murray/devcontainer-templates/tree/main/src/wordpress-mysql](https://github.com/Jacques-Murray/devcontainer-templates/tree/main/src/wordpress-mysql)

- **License:**  
  [https://github.com/Jacques-Murray/devcontainer-templates/blob/main/LICENSE](https://github.com/Jacques-Murray/devcontainer-templates/blob/main/LICENSE)
