class ApplicationStrings {
  static ApplicationStrings? _instace;
  static ApplicationStrings get instance{
    if(_instace!=null) return _instace!;
    _instace=ApplicationStrings._init();
    return _instace!;
  }
  ApplicationStrings._init();

  final String cartTitle='Cart';
  
  final String checkOut="Check Out";
  
  final String subTotal="Sub-total";
  final String delivery="Delivery";
  final String total="Total";
  
}