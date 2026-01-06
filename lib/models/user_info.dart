import 'package:xml/xml.dart';

UserInfo userInfoFromXml(String str) =>
    UserInfo.fromXml( XmlDocument.parse(str).getElement('user-info')! );

class UserInfo {
  String name;
  int balance;
  Card card;
  int level;
  String phone;

  UserInfo({
    required this.name,
    required this.balance,
    required this.card,
    required this.level,
    required this.phone,
  });

  factory UserInfo.fromXml(XmlElement xml) {
    String getText(String elementName) =>
        xml.getElement(elementName)?.innerText ?? '';
    
    String getCardText(String elementName) =>
        xml.getElement('card')?.getElement(elementName)?.innerText ?? '';

    return UserInfo(
      name: getText('name'),
      balance: int.parse(getText('balance')),
      card: Card(
        number: getCardText('number'),
        expiryMonth: int.parse(getCardText('expiry-month')),
        expiryYear: int.parse(getCardText('expiry-year')),
        type: getCardText('type'),
        name: getCardText('name'),
        merchant: getCardText('merchant'),

      ),
      level: int.parse(getText('level')),
      phone: getText('phone')
    );
  }
}

class Card {
  String merchant;
  String name;
  String number;
  int expiryMonth;
  int expiryYear;
  String type;

  Card({
    required this.merchant,
    required this.name,
    required this.number,
    required this.expiryMonth,
    required this.expiryYear,
    required this.type,
  });
}
