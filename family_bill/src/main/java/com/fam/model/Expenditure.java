package com.fam.model;

import java.util.Objects;

public class Expenditure {

    private String avaFun;
    private String dateCur;
    private String totalArrears;
    private String fund;
    private String fixed;
    private String addi;


    public String getAvaFun() {
        return avaFun;
    }

    public void setAvaFun(String avaFun) {
        this.avaFun = avaFun;
    }

    public String getDateCur() {
        return dateCur;
    }

    public void setDateCur(String dateCur) {
        this.dateCur = dateCur;
    }

    public String getTotalArrears() {
        return totalArrears;
    }

    public void setTotalArrears(String totalArrears) {
        this.totalArrears = totalArrears;
    }

    public String getFund() {
        return fund;
    }

    public void setFund(String fund) {
        this.fund = fund;
    }

    public String getFixed() {
        return fixed;
    }

    public void setFixed(String fixed) {
        this.fixed = fixed;
    }

    public String getAddi() {
        return addi;
    }

    public void setAddi(String addi) {
        this.addi = addi;
    }

    @Override
    public String toString() {
        return "Expenditure{" +
                "avaFun='" + avaFun + '\'' +
                ", dateCur='" + dateCur + '\'' +
                ", totalArrears='" + totalArrears + '\'' +
                ", fund='" + fund + '\'' +
                ", fixed='" + fixed + '\'' +
                ", addi='" + addi + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Expenditure that = (Expenditure) o;
        return Objects.equals(avaFun, that.avaFun) &&
                Objects.equals(dateCur, that.dateCur) &&
                Objects.equals(totalArrears, that.totalArrears) &&
                Objects.equals(fund, that.fund) &&
                Objects.equals(fixed, that.fixed) &&
                Objects.equals(addi, that.addi);
    }

    @Override
    public int hashCode() {

        return Objects.hash(avaFun, dateCur, totalArrears, fund, fixed, addi);
    }
}
