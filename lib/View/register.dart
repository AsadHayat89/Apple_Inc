import 'package:apple_inc/Constants/color.dart';
import 'package:apple_inc/View/AddDetails.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              width: width,
              color: AppColor.background1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 20),
                      child: Text(
                        "KPIs | Apple Inc",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDetails(name:"Revenue")));

                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: AppColor.background1, // background color
                          borderRadius:
                              BorderRadius.circular(10), // rounded corners
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top:15,bottom: 15,left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Revenue",
                                        style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                      SizedBox(width: 6,),
                                      Icon(Icons.info_outline_rounded,color: Colors.white,size: 16,)
                                    ],
                                  ),
                                  Text(
                                    "Core KPI",
                                    style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 12),
                                  ),
                                ],
                              ),
                              Text(
                                "Feb 2022",
                                style: TextStyle(color: AppColor.datecolor,fontSize: 22,fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDetails(name:"Net-Cash-Burn")));

                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: AppColor.background1, // background color
                          borderRadius:
                          BorderRadius.circular(10), // rounded corners
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top:15,bottom: 15,left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Net Cash Burn",
                                        style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                      SizedBox(width: 6,),
                                      Icon(Icons.info_outline_rounded,color: Colors.white,size: 16,)
                                    ],
                                  ),
                                  Text(
                                    "Core KPI",
                                    style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 12),
                                  ),
                                ],
                              ),
                              Text(
                                "Feb 2022",
                                style: TextStyle(color: AppColor.datecolor,fontSize: 22,fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDetails(name:"Cost-Total")));

                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: AppColor.background1, // background color
                          borderRadius:
                          BorderRadius.circular(10), // rounded corners
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top:15,bottom: 15,left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Cost Total",
                                        style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                      SizedBox(width: 6,),
                                      Icon(Icons.info_outline_rounded,color: Colors.white,size: 16,)
                                    ],
                                  ),
                                  Text(
                                    "Core KPI",
                                    style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 12),
                                  ),
                                ],
                              ),
                              Text(
                                "Feb 2022",
                                style: TextStyle(color: AppColor.datecolor,fontSize: 22,fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDetails(name:"Ruway")));

                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: AppColor.background1, // background color
                          borderRadius:
                          BorderRadius.circular(10), // rounded corners
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top:15,bottom: 15,left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Runway",
                                        style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                      SizedBox(width: 6,),
                                      Icon(Icons.info_outline_rounded,color: Colors.white,size: 16,)
                                    ],
                                  ),
                                  Text(
                                    "Core KPI",
                                    style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 12),
                                  ),
                                ],
                              ),
                              Text(
                                "Feb 2022",
                                style: TextStyle(color: AppColor.datecolor,fontSize: 22,fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDetails(name:"Cost-labour")));

                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: AppColor.background1, // background color
                          borderRadius:
                          BorderRadius.circular(10), // rounded corners
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top:15,bottom: 15,left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Cost Labour",
                                        style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                      SizedBox(width: 6,),
                                      Icon(Icons.info_outline_rounded,color: Colors.white,size: 16,)
                                    ],
                                  ),
                                  Text(
                                    "Core KPI",
                                    style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 12),
                                  ),
                                ],
                              ),
                              Text(
                                "Feb 2022",
                                style: TextStyle(color: AppColor.datecolor,fontSize: 22,fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDetails(name:"Cash-Balance")));

                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: AppColor.background1, // background color
                          borderRadius:
                          BorderRadius.circular(10), // rounded corners
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top:15,bottom: 15,left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Cash Balance",
                                        style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                      SizedBox(width: 6,),
                                      Icon(Icons.info_outline_rounded,color: Colors.white,size: 16,)
                                    ],
                                  ),
                                  Text(
                                    "Core KPI",
                                    style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 12),
                                  ),
                                ],
                              ),
                              Text(
                                "Feb 2022",
                                style: TextStyle(color: AppColor.datecolor,fontSize: 22,fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDetails(name:"HeadCount")));

                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: AppColor.background1, // background color
                          borderRadius:
                          BorderRadius.circular(10), // rounded corners
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top:15,bottom: 15,left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Headcount",
                                        style: TextStyle(color: Colors.white,fontSize: 18),
                                      ),
                                      SizedBox(width: 6,),
                                      Icon(Icons.info_outline_rounded,color: Colors.white,size: 16,)
                                    ],
                                  ),
                                  Text(
                                    "Core KPI",
                                    style: TextStyle(color: Colors.grey.withOpacity(0.5),fontSize: 12),
                                  ),
                                ],
                              ),
                              Text(
                                "Feb 2022",
                                style: TextStyle(color: AppColor.datecolor,fontSize: 22,fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
