import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:path/path.dart';
import 'package:image/image.dart' as imageLib;
import 'package:photofilters/filters/preset_filters.dart';
import 'package:photofilters/widgets/photo_filter.dart';

// 페이지가 뜰때 생성됨 ( bottom nav 에서 연결했기 때문에 )
class UploadController extends GetxController {
  var albums = <AssetPathEntity>[];
  RxList<AssetEntity> imageList = <AssetEntity>[].obs;
  RxString headerTitle = "".obs;
  Rx<AssetEntity> selectedImage = const AssetEntity(
    id: '0',
    typeInt: 0,
    width: 0,
    height: 0,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    _loadPhotos();
  }

  void _loadPhotos() async {
    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        filterOption: FilterOptionGroup(
            imageOption: const FilterOption(
              sizeConstraint: SizeConstraint(minHeight: 100, minWidth: 100),
            ),
            orders: const [
              // 사진이 최신순으로
              OrderOption(type: OrderOptionType.createDate, asc: false)
            ]),
      );
      _loadData();
    } else {
      // 권한 요청
    }
  }

  void _loadData() async {
    changeAlbum(albums.first);
    // headerTitle(albums.first.name);
    // await _pagingPhotos();
    // update();
    // setState(() {
    //   headerTitle = albums.first.name;
    // });
    // print(albums.first.name);
  }

  Future<void> _pagingPhotos(AssetPathEntity album) async {
    imageList.clear();

    var photos = await album.getAssetListPaged(page: 0, size: 30); // 처음에 30개
    imageList.addAll(photos);
    changeSelectedImage(imageList.first);
  }

  changeSelectedImage(AssetEntity image) {
    selectedImage(image);
  }

  void changeAlbum(AssetPathEntity album) async {
    // headerTitle(albums.first.name);
    headerTitle(album.name);
    await _pagingPhotos(album);
    // Get.back(); 맨처음 들어오면 바로 뒤로 나가버림
  }

  void gotoImageFilter() async {
    var file = await selectedImage.value.file;
    var fileName = basename(file!.path);
    var image = imageLib.decodeImage(file.readAsBytesSync());
    image = imageLib.copyResize(image!, width: 1000);
    var imagefile = await Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: (context) => PhotoFilterSelector(
          title: const Text('Photo Filter Example'),
          image: image!,
          filters: presetFiltersList,
          filename: fileName,
          loader: const Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain,
        ),
      ),
    );
    // if (imagefile != null && imagefile.containsKey('image_filtered')) {
    //   filteredImage = imagefile['image_filtered'];
    //   Get.to(() => const UploadDescription());
    // }
  }
}
