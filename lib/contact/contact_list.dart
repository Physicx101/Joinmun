import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joinmun_2019/model/contact.dart';
import 'package:joinmun_2019/utils/calls_and_messages_service.dart';
import 'package:joinmun_2019/utils/tools.dart';

class ContactList extends StatelessWidget {
  final List<Contact> allContacts;
  final CallsAndMessagesService service; //= locator<CallsAndMessagesService>();

  Widget contactActions(context, Contact contact) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.envelope,
                size: 15,
              ),
              onPressed: () => service.sendEmail(contact.contactEmail),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.phoneAlt,
                size: 15,
              ),
              onPressed: () => service.call(contact.contactPhone),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.sms,
                size: 15,
              ),
              onPressed: () => service.sendSms(contact.contactPhone),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.whatsapp,
                size: 15,
                color: Colors.green,
              ),
              onPressed: () => service.sendWhatsapp(contact.contactPhone),
            ),
          ],
        ),
      );

  const ContactList(
      {Key key, @required this.allContacts, @required this.service})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: allContacts.length,
      shrinkWrap: true,
      itemBuilder: (c, i) {
        return Card(
          elevation: 0.0,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  /*ConstrainedBox(
                              constraints: BoxConstraints.expand(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: contacts[i].contactImage ?? '',
                                placeholder: (context, url) => Container(),
                                errorWidget: (context, url, error) =>
                                    Container(),
                              ),
                            ),*/
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              allContacts[i].contactName,
                              style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 5,
                              color: Tools.multiColors[Random().nextInt(4)],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          allContacts[i].contactRole,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        contactActions(context, allContacts[i]),
                      ],
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
