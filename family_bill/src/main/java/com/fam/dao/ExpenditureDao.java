package com.fam.dao;

import com.fam.model.Expenditure;

public interface ExpenditureDao {
    Expenditure selectById(int id);
}
