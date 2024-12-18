// import 'package:flikka/auth/login_screen.dart';
import 'package:flikka/auth/widgets/my_button.dart';
import 'package:flikka/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AccountSetupPage extends StatefulWidget {
   final List<Map<String,String>> list;
   final PageController pageController;
   final int index;
   final bool image;
   final String txt;
  //  PageController pageController = PageController();
  AccountSetupPage({super.key, required this.list,required this.pageController, required this.image, required this.txt, required this.index});
 
  

  @override
  State<AccountSetupPage> createState() => _AccountSetupPageState();
}

class _AccountSetupPageState extends State<AccountSetupPage> {
  // late PageController _pageController;
  String? selected;
  // String? txt;
  // @override void initState() { super.initState(); _pageController = PageController(); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("completed ${widget.index}/6"),
          ),
          body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              // SizedBox(
              //   height: 10,
              // ),
              // Image.asset(
              //   "assets/images/earth.png",
              //   width: 100,
              // ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  textAlign: TextAlign.center,
                  widget.txt,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: widget.list.length,
                itemBuilder: (_, index) {
                  final selectedItems = widget.list[index];
                  final isSelected = selected == selectedItems['name'];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected=selectedItems['name'];
                      });
                    },
                    child: Container(
                      child: Row(
                        children: [
                         widget.image?Image.asset(selectedItems['image']!,width: 50,): Text(
                            style: TextStyle(fontSize: 24),
                           selectedItems['flag'] ?? '',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            selectedItems['name']!,
                          ),
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: isSelected
                              ? MyColors.primary
                              : MyColors.fadedBlueColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                },
              )),
              selected !=null?
              MyButton(word: "Next", onPressed: () {
                // Navigator.push( context, MaterialPageRoute(builder: (context) => LoginScreen()), );
               widget.pageController.nextPage( duration: Duration(milliseconds: 500), curve: Curves.easeInOut, );
                // widget.pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },)
            //  Row(
            //    children: [
            //      Expanded(
            //        child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: MyColors.primary,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12)
            //           ),
            //           padding: EdgeInsets.symmetric(vertical: 20)
            //         ),
            //         onPressed: () {
                     
            //        }, child: Text("Continue")),
            //      ),
            //    ],
            //  ):
             :Container()
            ],
          ),
        ),
      ),
        );
  }
}