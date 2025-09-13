package com.klef.jfsd.springboot.model;

import java.math.BigDecimal;

public class DashboardData {

    private BigDecimal totalSales;
    private long userCount;

    public DashboardData(BigDecimal totalSales, long userCount) {
        this.totalSales = totalSales;
        this.userCount = userCount;
    }

    public BigDecimal getTotalSales() {
        return totalSales;
    }

    public void setTotalSales(BigDecimal totalSales) {
        this.totalSales = totalSales;
    }

    public long getUserCount() {
        return userCount;
    }

    public void setUserCount(long userCount) {
        this.userCount = userCount;
    }
}
