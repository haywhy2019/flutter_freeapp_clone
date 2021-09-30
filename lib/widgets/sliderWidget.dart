import 'package:flutter/material.dart';
import 'package:free_app/model/listenSliderModel.dart';

class SliderWidget extends StatelessWidget {
  double mobileWidth;
  List<ListenSlider> sliderItem;

  SliderWidget(this.mobileWidth, this.sliderItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Stack(
            children: [
              Image.asset(
                sliderItem[index].image,
                width: mobileWidth,
                height: 400,
                fit: BoxFit.cover,
                color: Colors.black26,
                colorBlendMode: BlendMode.darken,
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(15),
                      right: Radius.circular(15),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        sliderItem.indexOf(sliderItem[index + 1]).toString(),
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      Text("/",
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                      Text(
                        (sliderItem.length - 1).toString(),
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                width: mobileWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sliderItem[index].title,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            sliderItem[index].subtitle,
                            style:
                                TextStyle(fontSize: 15, color: Colors.white38),
                          )
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
        itemCount: sliderItem.length - 1,
      ),
    );
  }
}
