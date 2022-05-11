import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

// 페이지가 뜰때 생성됨 ( bottom nav 에서 연결했기 때문에 )
class UploadController extends GetxController {
  var albums = <AssetPathEntity>[];
  RxList<AssetEntity> imageList = <AssetEntity>[].obs;
  RxString headerTitle = "".obs;
  Rx<AssetEntity> selectedImage = const AssetEntity(id: '0', typeInt: 0, width: 0, height: 0).obs;

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
    headerTitle(albums.first.name);
    await _pagingPhotos();
    // update();
    // setState(() {
    //   headerTitle = albums.first.name;
    // });
    // print(albums.first.name);
  }

  Future<void> _pagingPhotos() async {
    var photos = await albums.first.getAssetListPaged(page: 0, size: 30); // 처음에 30개
    imageList.addAll(photos);
    changeSelectedImage(imageList.first);
  }

  changeSelectedImage(AssetEntity image) {
    selectedImage(image);
  }
}
