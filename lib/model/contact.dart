class ContactsData {
  List<Contact> contacts;

  ContactsData({this.contacts});

  ContactsData.fromJson(Map<String, dynamic> json) {
    if (json['Contactss'] != null) {
      contacts = new List<Contact>();
      json['Contactss'].forEach((v) {
        contacts.add(Contact.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contacts != null) {
      data['contacts'] = this.contacts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contact implements Comparable<Contact> {
  String contactName;
  String contactImage;
  String contactRole;
  String contactEmail;
  String contactPhone;

  Contact(
      {this.contactName, this.contactImage, this.contactRole, this.contactEmail, this.contactPhone});

  factory Contact.fromMap(Map data) {
    data = data ?? {};
    return Contact(
      contactName: data['contact_name'] ?? '',
      contactRole: data['contact_role'] ?? '',
      contactEmail: data['contact_email'] ?? '',
      contactPhone: data['contact_phone'] ?? '',
    );
  }

  Contact.fromJson(Map<String, dynamic> json) {
    contactName = json['contact_name'];
    contactImage = json['contact_image'];
    contactRole = json['contact_role'];
    contactEmail = json['contact_email'];
    contactPhone = json['contact_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_name'] = this.contactName;
    data['contact_image'] = this.contactImage;
    data['contact_role'] = this.contactRole;
    data['contact_email'] = this.contactEmail;
    data['contact_phone'] = this.contactPhone;
    return data;
  }

  @override
  int compareTo(Contact other) => contactRole.compareTo(other.contactRole);
}
