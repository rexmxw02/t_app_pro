import '../models/income_record.dart';

class DataService {
  static const records = [
    IncomeRecord(month: '2025-12', type: '工资薪金', subType: '正常工资薪金', company: '优视科技（中国）有限公司', income: 34749.63, tax: 4033.25, insurance: 2680, fund: 2100),
    IncomeRecord(month: '2025-11', type: '工资薪金', subType: '正常工资薪金', company: '优视科技（中国）有限公司', income: 32600.00, tax: 3603.32, insurance: 2680, fund: 2100),
    IncomeRecord(month: '2025-10', type: '工资薪金', subType: '正常工资薪金', company: '优视科技（中国）有限公司', income: 32550.00, tax: 3523.57, insurance: 2680, fund: 2100),
    IncomeRecord(month: '2025-09', type: '工资薪金', subType: '正常工资薪金', company: '优视科技（中国）有限公司', income: 32480.00, tax: 3498.20, insurance: 2680, fund: 2100),
    IncomeRecord(month: '2025-08', type: '工资薪金', subType: '正常工资薪金', company: '优视科技（中国）有限公司', income: 31800.00, tax: 3312.80, insurance: 2680, fund: 2100),
    IncomeRecord(month: '2025-07', type: '劳务报酬', subType: '一般劳务报酬', company: '星辰信息服务中心', income: 8800.00, tax: 820.00, insurance: 0, fund: 0),
  ];

  static double get totalIncome => records.fold(0, (s, e) => s + e.income);
  static double get totalTax => records.fold(0, (s, e) => s + e.tax);
}
