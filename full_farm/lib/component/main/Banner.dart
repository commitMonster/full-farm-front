import 'package:flutter/material.dart';

class EventBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: Stack(
          children: [
            EventBannerpageVeiw(),
            Positioned(
              child: _leftBannerButton,
              top: 250,
              left: 10,
            ),
            Positioned(top: 250, right: 10, child: _rightBannerButton)
          ],
        ));
  }
}

int _bannerPageNum = 0;
final PageController controller = PageController(initialPage: _bannerPageNum);


Widget EventBannerpageVeiw() {
  final image = 'image/forest.jpg';
  final location; //이미지와 공지,이벤트 페이지 주소 받아오기
  return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: [
        _bannerLists(image),
        _bannerLists(image),
        _bannerLists(image),
      ]);
}

Widget _leftBannerButton = IconButton(
    icon: const Icon(
      Icons.arrow_back_ios,
    ),
    onPressed: () =>
    { if(controller.hasClients && _bannerPageNum != 0){
      _bannerPageNum -= 1
    },
      controller.animateToPage(
        _bannerPageNum ,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      ),
      print(_bannerPageNum)
    });

Widget _rightBannerButton = IconButton(
    icon: const Icon(Icons.arrow_forward_ios),
    onPressed: () =>
    {
      if(controller.hasClients){
        _bannerPageNum += 1
      },
      controller.animateToPage(
        _bannerPageNum,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,)
      ,
      print(_bannerPageNum)
    });

Widget _bannerLists(image, {location}) {
  return TextButton(
      onPressed: () => {print(location)},
      child: Image.asset(image // 이미지, 페이지 주소 관리자 페이지에서 등록 가능하게, DB에 받아올//
      ));
}