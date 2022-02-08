import 'package:flutter/material.dart';
import 'package:flutter_view_api/pages/detailsPage.dart';

singleUserListWidget(
    String picture, String fullName, String location, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserDetailsPage(
                  fullName: fullName,
                  imagePath: picture,
                )),
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 200,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(picture),
            ),
            SizedBox(
              height: 10,
            ),
            Text(fullName),
            Text(location),
          ],
        ),
      ),
    ),
  );
}
