import 'package:contacts_service/contacts_service.dart';
import 'package:crime_curber/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crime_curber/model/uploadContact.dart';
import 'package:crime_curber/Animation/bottomAnimation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart';

class PhoneBook extends StatefulWidget {
  final FirebaseUser user;
  final bool contactAvailable;
  final Function(bool) callback;

  PhoneBook({this.user, this.contactAvailable, this.callback});

  @override
  _PhoneBookState createState() => _PhoneBookState();
}

class _PhoneBookState extends State<PhoneBook> {
  List<Contact> _contacts;
  List<Contact> filteredContacts;

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissionStatus =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.contacts]);
      return permissionStatus[PermissionGroup.contacts] ??
          PermissionStatus.unknown;
    } else {
      return permission;
    }
  }

  refreshContacts() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      var contacts =
          (await ContactsService.getContacts(withThumbnails: false)).toList();
      setState(() {
        _contacts = contacts;
        filteredContacts = _contacts;
      });
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      throw new PlatformException(
          code: "PERMISSION_DENIED",
          message: "Access to location data denied",
          details: null);
    } else if (permissionStatus == PermissionStatus.denied) {
      throw new PlatformException(
          code: "PERMISSION_DISABLED",
          message: "Location data is not available on device",
          details: null);
    }
  }

  @override
  initState() {
    super.initState();
    refreshContacts();
  }

  Future<bool> goBack() async {
    var db =
        FirebaseDatabase.instance.reference().child(widget.user.phoneNumber);
    db.once().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        widget.callback(true);
        Navigator.pop(context);
      } else {
        widget.callback(false);
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: blue_button,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded,
          color: Colors.white),
          onPressed: () {
            // goBack();
          },
        ),
        title: TextField(
          textInputAction: TextInputAction.search,
          style: TextStyle(color: Colors.white),
          cursorColor: blue_button,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: blue_button)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: blue_button)),
              //prefixIcon: Icon(Icons.search,
                  //color: Colors.white, size: height * 0.03),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white,fontSize: 20,
              fontFamily: "SourceSansPro")),
          onChanged: (string) {
            setState(() {
              filteredContacts = _contacts
                  .where((c) => (c.displayName
                      .toLowerCase()
                      .contains(string.toLowerCase())))
                  .toList();
            });
          },
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      body: _contacts != null
          ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welc_bg.png"),
                fit: BoxFit.cover)),
              height: height,
              width: width,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: height * 0.01),
                separatorBuilder: (context, index) {
                  return Divider(height: height * 0.01);
                },
                itemCount: filteredContacts?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  Contact c = filteredContacts?.elementAt(index);
                  return ItemsTile(widget.user, c, c.phones);
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xffbe3a5a))),
            ),
    );
  }
}

class ItemsTile extends StatefulWidget {
  ItemsTile(this.user, this.c, this._items);

  final Contact c;
  final Iterable<Item> _items;
  final FirebaseUser user;

  @override
  _ItemsTileState createState() => _ItemsTileState();
}

class _ItemsTileState extends State<ItemsTile> {
  List<UploadContact> uploadContactList = List();
  UploadContact uploadContact;
  DatabaseReference contactRef;

  @override
  void initState() {
    super.initState();
    uploadContact = UploadContact(" ", " ");
    contactRef =
        FirebaseDatabase.instance.reference().child(widget.user.phoneNumber);
    contactRef.onChildAdded.listen(_onContactAdded);
  }

  void contactToBeUpload() {
    contactRef.push().set(uploadContact.toJson());
  }

  _onContactAdded(Event event) {
    setState(() {
      uploadContactList.add(UploadContact.fromSnapshot(event.snapshot));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    checkingContactsLength() {
      List<String> numbers = [];
      var db =
          FirebaseDatabase.instance.reference().child(widget.user.phoneNumber);
      db.once().then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;
        if (snapshot.value != null) {
          values.forEach((key, values) async {
            numbers.add(values["phone"]);
          });
          if (numbers.length < 3) {
            uploadContact.name = widget.c.displayName;
            var phoneNumber =
                widget._items.map((i) => i.value ?? " ").toString();
            var newPhone = phoneNumber.replaceAll(RegExp(r"[^\name\w]"), '');
            if (newPhone.length == 12) {
              uploadContact.phoneNumber =
                  "+" + newPhone.substring(0, newPhone.length);
            }
            if (newPhone.length == 11) {
              uploadContact.phoneNumber =
                  "+91" + newPhone.substring(1, newPhone.length);
            }
            if (newPhone.length > 12) {
              var start2Number = newPhone.substring(0, 2);
              if (start2Number == "91") {
                uploadContact.phoneNumber = "+" + newPhone.substring(0, 12);
              }
              if (start2Number == "03") {
                uploadContact.phoneNumber =
                    "+91" + newPhone.substring(1, newPhone.length);
              }
            }
            Toast.show("${widget.c.displayName} Added!", context,
                backgroundRadius: 5,
                gravity: Toast.CENTER,
                textColor: Colors.black,
                backgroundColor: Colors.white,
                duration: 1);
            contactToBeUpload();
          } else {
            Toast.show("Cannot add more than 3 contacts!", context,
                backgroundColor: Colors.red,
                backgroundRadius: 5,
                duration: 3,
                gravity: Toast.CENTER);
          }
        } else {
          uploadContact.name = widget.c.displayName;
          var phoneNumber = widget._items.map((i) => i.value ?? " ").toString();
          var newPhone = phoneNumber.replaceAll(RegExp(r"[^\name\w]"), '');
          if (newPhone.length == 12) {
            uploadContact.phoneNumber =
                "+" + newPhone.substring(0, newPhone.length);
          }
          if (newPhone.length == 11) {
            uploadContact.phoneNumber =
                "+91" + newPhone.substring(1, newPhone.length);
          }
          if (newPhone.length > 12) {
            var start2Number = newPhone.substring(0, 2);
            if (start2Number == "91") {
              uploadContact.phoneNumber = "+" + newPhone.substring(0, 12);
            }
            if (start2Number == "03") {
              uploadContact.phoneNumber =
                  "+91" + newPhone.substring(1, newPhone.length);
            }
          }
          contactToBeUpload();
          Toast.show("${widget.c.displayName} Added!", context,
              backgroundRadius: 5,
              textColor: Colors.black,
              backgroundColor: Colors.white,
              gravity: Toast.CENTER,
              duration: 1);
        }
      });
    }

    return WidgetAnimator(
      ListTile(
        onTap: () {
          checkingContactsLength();
        },
        leading: CircleAvatar(
            backgroundColor: blue_button,
            child: Text('${widget.c.displayName[0]}',
                style: TextStyle(color: Colors.white,
              fontFamily: "SourceSansPro")),
            radius: height * 0.025),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.c.displayName ?? "",
              style: TextStyle(color: dark_charcoal, fontSize: height * 0.022),
            ),
            SizedBox(height: height * 0.01),
            Column(
                children: widget._items
                    .map(
                      (i) => Text(
                        i.value + "\t" ?? "",
                        style: TextStyle(color: dark_charcoal),
                      ),
                    )
                    .toList())
          ],
        ),
        trailing: Text('Tap', style: TextStyle(color: dark_charcoal)),
      ),
    );
  }
}