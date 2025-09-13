# Agromart

<p align="center">
  <img src="https://drive.google.com/uc?export=view&id=1A6qgCLYuLM4R_RSRk1aAmGOetUNs4tKq" alt="Logo" width="200"/>
</p>


## Project Description
Agromart is a Java Full-Stack web application designed to empower farmers by helping them turn their crops into more valuable products, such as processed foods or handmade goods. The platform connects farmers directly to global buyers, promoting sustainable agricultural practices and rural entrepreneurship using modern technology.

This project was developed as part of the "Skill Development Project" (SDP-1) by the team at KL University. The application provides separate roles for Admins, Farmers, and Buyers, each with specific functionalities to streamline product management, transactions, and communication.

---

## Table of Contents
- [Installation Instructions](#installation-instructions)
- [Usage](#usage)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Roles and Responsibilities](#roles-and-responsibilities)
- [License](#license)

---

## Installation Instructions
Follow these steps to set up the project locally:

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   
# Setting up and Running the Spring Boot Project in Eclipse

## 1. Ensure Spring Tool Suite (STS) Plugin is Installed in Eclipse

- Open Eclipse IDE.
- Go to **Help** → **Eclipse Marketplace**.
- Search for **Spring Tool Suite**.
- Install the plugin if it is not already installed.

## 2. Import the Project as a Maven Project

- Open Eclipse IDE.
- Go to **File** → **Import**.
- Select **Maven** → **Existing Maven Projects**.
- Click **Next**.
- Browse to the directory where your project is located.
- Select the project and click **Finish**.

## 3. Configure Database

### Set Up a MySQL Database

- Install MySQL if not already installed.
- Create a new database for your application.

  ```sql
  CREATE DATABASE your_database_name;
  
- Update application.properties or application.yml with Your Database Credentials

## 4. Run the Application
- Open the **Spring Boot Dashboard** in Eclipse
- Open the Spring Boot Dashboard from the Window → Show View → Spring Boot Dashboard.
- Run SDPProject application as a Spring Boot App
- In the Spring Boot Dashboard, locate your project.
- Right-click the project → Restart.

## Usage

**Admin**
- Login securely to manage farmers, products, transactions, and reports.
- Approve, edit, delete, or view products.
- View and generate sales reports and monitor user activities.

**Farmer**
- Create and manage profiles.
- Add, update, and delete value-added products.
- Track inventory, orders, and sales performance.
- Communicate with buyers via the built-in messaging system.

**Buyer**
- Browse and search for products.
- Place orders and make secure payments.
- Track order status and communicate with farmers.
- Save favorite products or farmers for future purchases.

## Features

**Front-End**
- User authentication and registration for Admins, Farmers, and Buyers.
- Personalized dashboards for Farmers and Buyers.
- Product catalog with filtering by category, price, and region.
- Order management interface.
- Transaction history viewing.
- Built-in messaging system for communication.

**Back-End**
- Role-based authentication using JWT and encrypted passwords.
- CRUD operations for product management.
- Secure payment gateway integration.
- Real-time messaging functionality.
- Database integration using Spring Data JPA.
- Notification system via email or SMS.

## Technologies Used

**Front-End**: HTML, CSS, Bootstrap, ReactJS

**Back-End**: Java, Spring Boot, REST API, Microservices Architecture

**Database**: MySQL

**ORM**: Spring Data JPA

**IDE**: Eclipse with Spring Tool Suite (STS) plugin


## Project Structure
```
SDPProject
├─ src/main/java/com/klef/jfsd/springboot
│  ├─ controller
│  ├─ model
│  ├─ repository
│  └─ service
├─ src/main/resources
│  ├─ static
│  └─ templates
└─ src/main/webapp
   └─ *.jsp files
```

## Roles and Responsibilities

### Admin
- Manages users, products, transactions, and reports.
### Farmer
- Adds and manages value-added products, inventory, and sales.
### Buyer
- Browses products, places orders, and communicates with farmers.

## Future Improvements
- **Advanced Analytics:** Provide farmers with insights on market trends, crop pricing, and sales performance.
- **Multi-Language Support:** Add support for regional languages to make the platform more accessible to farmers in different regions.
- **Logistics and Delivery Tracking:** Add a feature for tracking shipments and delivery status in real-time.
- **Sustainability Tracking:** Provide metrics for sustainable farming practices and eco-friendly product certifications.

---

## Contact
For any queries or support related to this project, you can reach me:
- Email: syamuppu05@gmail.com
- GitHub: [https://github.com/syamprasad187/AgroMart-SpringBoot](https://github.com/syamprasad187/AgroMart-SpringBoot)
- LinkedIn: [https://www.linkedin.com/in/syamprasaduppu/](https://www.linkedin.com/in/syamprasaduppu/)  
