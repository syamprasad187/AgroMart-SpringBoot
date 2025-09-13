<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1 align="center" >Admin Dashboard</h1>

    <!-- Bar Chart: Sales Insights -->
    <canvas id="salesChart" width="400" height="200"></canvas>

    <!-- Pie Chart: User Analytics -->
    <canvas id="userChart" width="400" height="200"></canvas>

    <script>
        // Data from backend (dashboardData object)
        const dashboardData = ${dashboardData}; // Automatically injected by Spring

        // Sales Chart: Total Sales
        const salesCtx = document.getElementById('salesChart').getContext('2d');
        new Chart(salesCtx, {
            type: 'bar',
            data: {
                labels: ['Total Sales'],  // Label for the chart
                datasets: [{
                    label: 'Total Sales',
                    data: [dashboardData.totalSales], // Display total sales data
                    backgroundColor: 'rgba(75, 192, 192, 0.2)', // Background color of bars
                    borderColor: 'rgba(75, 192, 192, 1)', // Border color of bars
                    borderWidth: 1 // Border width of bars
                }]
            }
        });

        // User Analytics: Total User Count
        const userCtx = document.getElementById('userChart').getContext('2d');
        new Chart(userCtx, {
            type: 'pie',  // Pie chart
            data: {
                labels: ['Users'],  // Label for pie chart
                datasets: [{
                    data: [dashboardData.userCount], // Display user count data
                    backgroundColor: ['rgba(153, 102, 255, 0.2)'], // Color of the pie section
                    borderColor: ['rgba(153, 102, 255, 1)'], // Border color of the pie section
                    borderWidth: 1 // Border width of the pie sections
                }]
            }
        });
    </script>
</body>
</html>
