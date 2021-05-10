import 'package:flutter/material.dart';

class EventBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child:Stack(
      children: [

        EventBannerpageVeiw(),
        Positioned(
          child: _leftBannerButton,
          top:250,
          left:10,
        ),
        Positioned(
            top:250,
            right: 10,
            child: _rightBannerButton)
      ],
    )
    );
  }
}

Widget _leftBannerButton = IconButton(
    icon: const Icon(
      Icons.arrow_back_ios,
    ),
    onPressed: () => {print('왼쪽버튼')});

Widget _rightBannerButton = IconButton(
    icon: const Icon(Icons.arrow_forward_ios),
    onPressed: () => {print('오른쪽버튼')});

Widget _bannerLists(image, {location}) {
  return TextButton(
      onPressed: () => {print(location)},
      child: Image.asset(image // 이미지, 페이지 주소 관리자 페이지에서 등록 가능하게, DB에 받아올//
          ));
}

Widget EventBannerpageVeiw() {
  final PageController controller = PageController(initialPage: 0);
  final image = 'image/forest.jpg';
  return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: [
        _bannerLists(image),
        _bannerLists(image),
        _bannerLists(image),
      ]);
}
