// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import "package:flutter/material.dart";
import 'package:velocity_x/velocity_x.dart';


class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin{
  final pkImage = "https://avatars.githubusercontent.com/u/29032361?v=4";
  final pic1 = "https://images.unsplash.com/photo-1533929736458-ca588d08c8be";
  final pic2 = "https://images.unsplash.com/photo-1582050041567-9cfdd330d545?ixlib=rb-1.2";

  late TabController _tabController;
  double anim = 1.0;
  double anim2 = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  

    withAnimation(
      vsync: this, 
      tween: Tween(begin: 1.0, end: 0.0), 
      callBack: (animationVal, controllerVal) {
      anim = animationVal!;
      setState(() {});
    },
    );

    withRepeatAnimation(
      vsync: this, 
      tween: Tween(begin: 2.0, end: 3.0), 
      isRepeatReversed: true, 
      callBack: (animationVal, controllerVal) {
      anim2 = animationVal!;
      setState(() {});
      },
      );
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = _tabController.index;

    return Scaffold(
      backgroundColor: Vx.purple500,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            VxToast
            .show(
                context, 
                msg: "Side Menu tapped...!", 
                bgColor: Colors.black, 
                textColor: Colors.white
                );
          },
          child: VStack([
            VxBox().size(20, 2).white.make(),
            5.heightBox,
            VxBox().size(28, 2).white.make(),
            5.heightBox,
            VxBox().size(15, 2).white.make(),
          ]
          ).pOnly(left: 16, top: 16),
        ),
      ),
      body: VStack([
        InkWell(
          onTap: () {
             
             final close = context.showLoading(msg: "Loading", textColor: Colors.white);
             Future.delayed(2.seconds, close as FutureOr Function()?);
             //print("image tapped...!");
             //context.showToast(msg: "Hello from Umar Farooq");
          },
          child: VxBox(child: [
            VxBox()
            .square(100)
            .roundedFull
            .neumorphic(color: Vx.purple500, elevation: 30)
            .bgImage(DecorationImage(image: NetworkImage(pkImage)))
            .make(),
            
          
            "Hi, "
            .richText
            .withTextSpanChildren(["Umar".textSpan.bold.make()])
            .white
            .xl2
            .make()
            .p8()
            .offset(offset: Offset(-300 * anim, 0.0)),
          
            "Solo Traveller".text.white.make(),
          
          const VxTextField(
            borderType: VxTextFieldBorderType.none,
            borderRadius: 18,
            hint: "Search",
            fillColor: Vx.gray200,
            contentPaddingTop: 13,
            autofocus: false,
            prefixIcon: Icon(Icons.search_outlined, color: Colors.white),
          ).customTheme(
            themeData: ThemeData(
              brightness: Brightness.light,
            )
          )
          .cornerRadius(10)
          .p16()
          
          ].column())
            .makeCentered()
            .h32(context),
        ),

          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: VxBox(
              child: VStack([
                
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.purple,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Vx.purple500,
                  unselectedLabelColor: Vx.gray400,
                  labelPadding: Vx.m16,

                  tabs: [
                  const Icon(Icons.map, size: 10)
                  .scale(scaleValue: tabIndex == 0 ? anim2 : 3.0),
                  const Icon(Icons.pin_drop, size: 10)
                  .scale(scaleValue: tabIndex == 1 ? anim2 : 3.0),
                  const Icon(Icons.restaurant, size: 10)
                  .scale(scaleValue: tabIndex == 2 ? anim2 : 3.0),
                  const Icon(Icons.person, size: 10)
                  .scale(scaleValue: tabIndex == 3 ? anim2 : 3.0)
                ],
                ),
                TabBarView(
                  controller: _tabController,
                  children: ["1","2","3","4"].map((e) => VStack([
                    
                    "Discover places in London".text.gray600.xl2.bold.make(),
                     
                     InkWell(
                      onTap: () {
                        VxToast.show(
                          context, 
                          msg: "Tower Bridge is tapped...!", 
                          bgColor: Colors.black, 
                          textColor: Colors.white
                          );
                      },
                       child: TravelCard(
                        subtitle: "Southwork",
                        title: "Tower Bridge",
                        imageUrl: pic1,
                        ),
                     ),

                      10.heightBox,

                      TravelCard(
                      subtitle: "Country Hall",
                      title: "London Eye",
                      imageUrl: pic2,
                      ),
                  ]).p16()
                  ).toList(),
                ).expand()
              ]),
            ).white.make(),
          ).expand()

      ]),
    );
  }
}

class TravelCard extends StatelessWidget {
  final String imageUrl, title, subtitle;
  
   const TravelCard({
    super.key,
    required this.subtitle, required this.imageUrl, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return HStack([
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
              )
              .wh(context.percentWidth * 35, 100).cornerRadius(10),
              20.widthBox,
              VStack([
                title.text.semiBold.make(),
                3.heightBox,
                subtitle.text.make().shimmer(),
                5.heightBox,
                [
                  VxRating(
                    size: 13,
                    onRatingUpdate: (value) {},
                    ),
                    5.widthBox,
                    "(100)".text.xs.gray600.make()
                ].row()
              ],
              //crossAlignment: CrossAxisAlignment.start,
              ).expand()
            ]).cornerRadius(8).backgroundColor(Vx.gray200);
  }
}
