import 'package:flutter/material.dart';

class MyImages {
  Map<image, String> imagePath = {
    //photos
    image.ninja1: "assets/ninja_images/ninja_1.jpg",
    image.ninja2: "assets/ninja_images/ninja_2.png",
    image.ninja3: "assets/ninja_images/ninja_3.png",
    image.ninja4: "assets/ninja_images/ninja_4.png",
    image.ninja5: "assets/ninja_images/ninja_5.jpeg",
    image.ninja6: "assets/ninja_images/ninja_6.jpeg",
    //attributes
    image.byakugan: "assets/attributes/byakugan.jpg",
    image.sharingan: "assets/attributes/sharingan.jpg",
    image.jinchuriki: "assets/attributes/jinchuriki.jpg",
    //fronts
    image.buttonPlus: "assets/front/plus_button.jpg",
    image.buttonMinus: "assets/front/minus_button.jpg",
    //elements
    image.fire: "assets/elements/fire.jpg",
    image.water: "assets/elements/water.jpg",
    image.wind: "assets/elements/wind.jpg",
    image.thunder: "assets/elements/thunder.jpg",
    image.earth: "assets/elements/earth.jpg",
    //elements icons
    image.katonIcon: "assets/elements/icons/katon_icon.png",
    image.entonIcon: "assets/elements/icons/enton_icon.png",
    image.futtonIcon: "assets/elements/icons/futton_icon.png",
    image.hyotonIcon: "assets/elements/icons/hyoton_icon.png",
    image.jintonIcon: "assets/elements/icons/jinton_icon.png",
    image.jitonIcon: "assets/elements/icons/jiton_icon.png",
    image.mokutonIcon: "assets/elements/icons/mokuton_icon.png",
    image.rantonIcon: "assets/elements/icons/ranton_icon.png",
    image.shakutonIcon: "assets/elements/icons/shakuton_icon.png",
    image.yotonIcon: "assets/elements/icons/yoton_icon.png",
    image.bakutonIcon: "assets/elements/icons/bakuton_icon.png",
    image.waterIcon: "assets/elements/icons/water_icon.png",
    //jutsus
    image.jutsuFireBall: "assets/jutsus/katon/fire_ball.jpg",
    image.jutsuAshCloud: "assets/jutsus/katon/ash_cloud.jpg",
    image.jutsuBreathOfFire: "assets/jutsus/katon/breath_of_fire.jpg",
    image.jutsuSmallFireBalls: "assets/jutsus/katon/small_fire_balls.jpg",
    image.jutsuFlameBurst: "assets/jutsus/katon/flame_burst.jpg",
    image.jutsuFireDragon: "assets/jutsus/katon/fire_dragon.jpg",
    image.jutsuWaterDragon: "assets/jutsus/suiton/water_dragon.jpg",
    image.jutsuWaterSword: "assets/jutsus/suiton/water_sword.jpg",
    image.jutsuWaterClone: "assets/jutsus/suiton/water_clone.jpg",
    image.jutsuWaterPrison: "assets/jutsus/suiton/water_prison.jpg",
    image.jutsuTsunami: "assets/jutsus/suiton/tsunami.jpg",
    image.jutsuWaterRelease: "assets/jutsus/water/water_release.jpg",
  };
}

enum image {
  buttonMinus,
  buttonPlus,
  ninja1,
  ninja2,
  ninja3,
  ninja4,
  ninja5,
  ninja6,
  byakugan,
  sharingan,
  jinchuriki,
  bakutonIcon,
  earth,
  entonIcon,
  fire,
  futtonIcon,
  hyotonIcon,
  jintonIcon,
  jitonIcon,
  katonIcon,
  waterIcon,
  jutsuAshCloud,
  jutsuBreathOfFire,
  jutsuFireBall,
  jutsuFireDragon,
  jutsuFlameBurst,
  jutsuSmallFireBalls,
  jutsuTsunami,
  jutsuWaterClone,
  jutsuWaterDragon,
  jutsuWaterSword,
  jutsuWaterPrison,
  jutsuWaterRelease,
  mokutonIcon,
  rantonIcon,
  shakutonIcon,
  thunder,
  water,
  wind,
  yotonIcon,
}

class MyDecoration {
  static BoxShadow boxShadow = BoxShadow(
    color: const Color.fromARGB(110, 0, 0, 0).withOpacity(0.5),
    spreadRadius: 4,
    blurRadius: 7,
    offset: const Offset(3, 3), // changes position of shadow
  );
  static BoxShadow textFieldBoxShadow = BoxShadow(
    color: const Color.fromARGB(110, 0, 0, 0).withOpacity(0.5),
    spreadRadius: 1.0,
    blurRadius: 3,
    offset: const Offset(3, 3), // changes position of shadow
  );
  static Color green = Colors.green;
  static const Color bloodColor = Color.fromARGB(250, 107, 0, 0);
  static const TextStyle dataStyle = TextStyle(
    fontSize: 18,
  );
  static const TextStyle titleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
}
