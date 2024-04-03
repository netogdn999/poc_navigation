enum AppStrings {
  homeTitle("Finance"),
  listIncomeStatementAccountTitle("Contas de resultado"),
  incomeStatementAccountGendersTitle("Gênero das contas de resultado"),
  nothingToShown("Nada para ser exibido por enquanto!"),
  categoryNotSelected("Deve ser selecionada uma categoria"),

  //Income statement account register
  incomeStatementAccountRecordTitle("cadastrar conta de resultado"),
  valueZeroOrUnderZero("Valor não pode ser 0 ou abaixo de 0"),
  institutionNotSelected("Deve ser selecionada uma instituição"),
  typeNotSelected("Deve ser selecionado um tipo"),
  dateEmpty("Deve ser selecionada uma data"),
  nameEmpty("Nome não pode ser vazio"),
  institutionGroupNotSelected("Deve ser selecionado um grupo"),

  //Income statement account type register
  incomeStatementAccountTypeRecordTitle("cadastrar tipo de conta de resultado"),
  nameIncomeStatementAccountTypeEmpty("Nome não pode ser vazio"),

  //category 2 register
  category2RecordTitle("cadastrar categoria 2"),

  //category 1 register
  category1RecordTitle("cadastrar categoria 1"),

  //institution register
  institutionRecordTitle("cadastrar instituição"),

  //institution group register
  institutionGroupRecordTitle("cadastrar grupo de instituição"),

  //category 1 details
  category1DetailsTitle("detalhes da categoria"),

  //buttons
  register("Cadastrar");

  const AppStrings(this.value);
  final String value;

  @override
  String toString() => value;
}