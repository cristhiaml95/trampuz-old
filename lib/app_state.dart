import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _navOpen = prefs.getBool('ff_navOpen') ?? _navOpen;
    });
    _safeInit(() {
      _rowPerPage = prefs.getInt('ff_rowPerPage') ?? _rowPerPage;
    });
    _safeInit(() {
      _onlineMode = prefs.getBool('ff_onlineMode') ?? _onlineMode;
    });
    _safeInit(() {
      _maxNumRows = prefs.getString('ff_maxNumRows') ?? _maxNumRows;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _navOpen = false;
  bool get navOpen => _navOpen;
  set navOpen(bool value) {
    _navOpen = value;
    prefs.setBool('ff_navOpen', value);
  }

  List<String> _idsFromBarcodes = [];
  List<String> get idsFromBarcodes => _idsFromBarcodes;
  set idsFromBarcodes(List<String> value) {
    _idsFromBarcodes = value;
  }

  void addToIdsFromBarcodes(String value) {
    idsFromBarcodes.add(value);
  }

  void removeFromIdsFromBarcodes(String value) {
    idsFromBarcodes.remove(value);
  }

  void removeAtIndexFromIdsFromBarcodes(int index) {
    idsFromBarcodes.removeAt(index);
  }

  void updateIdsFromBarcodesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    idsFromBarcodes[index] = updateFn(_idsFromBarcodes[index]);
  }

  void insertAtIndexInIdsFromBarcodes(int index, String value) {
    idsFromBarcodes.insert(index, value);
  }

  List<String> _emptyList = [];
  List<String> get emptyList => _emptyList;
  set emptyList(List<String> value) {
    _emptyList = value;
  }

  void addToEmptyList(String value) {
    emptyList.add(value);
  }

  void removeFromEmptyList(String value) {
    emptyList.remove(value);
  }

  void removeAtIndexFromEmptyList(int index) {
    emptyList.removeAt(index);
  }

  void updateEmptyListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    emptyList[index] = updateFn(_emptyList[index]);
  }

  void insertAtIndexInEmptyList(int index, String value) {
    emptyList.insert(index, value);
  }

  List<String> _orderNos = [];
  List<String> get orderNos => _orderNos;
  set orderNos(List<String> value) {
    _orderNos = value;
  }

  void addToOrderNos(String value) {
    orderNos.add(value);
  }

  void removeFromOrderNos(String value) {
    orderNos.remove(value);
  }

  void removeAtIndexFromOrderNos(int index) {
    orderNos.removeAt(index);
  }

  void updateOrderNosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    orderNos[index] = updateFn(_orderNos[index]);
  }

  void insertAtIndexInOrderNos(int index, String value) {
    orderNos.insert(index, value);
  }

  List<String> _licences = [];
  List<String> get licences => _licences;
  set licences(List<String> value) {
    _licences = value;
  }

  void addToLicences(String value) {
    licences.add(value);
  }

  void removeFromLicences(String value) {
    licences.remove(value);
  }

  void removeAtIndexFromLicences(int index) {
    licences.removeAt(index);
  }

  void updateLicencesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    licences[index] = updateFn(_licences[index]);
  }

  void insertAtIndexInLicences(int index, String value) {
    licences.insert(index, value);
  }

  List<String> _uniRefNos = [];
  List<String> get uniRefNos => _uniRefNos;
  set uniRefNos(List<String> value) {
    _uniRefNos = value;
  }

  void addToUniRefNos(String value) {
    uniRefNos.add(value);
  }

  void removeFromUniRefNos(String value) {
    uniRefNos.remove(value);
  }

  void removeAtIndexFromUniRefNos(int index) {
    uniRefNos.removeAt(index);
  }

  void updateUniRefNosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    uniRefNos[index] = updateFn(_uniRefNos[index]);
  }

  void insertAtIndexInUniRefNos(int index, String value) {
    uniRefNos.insert(index, value);
  }

  List<String> _fmsRefs = [];
  List<String> get fmsRefs => _fmsRefs;
  set fmsRefs(List<String> value) {
    _fmsRefs = value;
  }

  void addToFmsRefs(String value) {
    fmsRefs.add(value);
  }

  void removeFromFmsRefs(String value) {
    fmsRefs.remove(value);
  }

  void removeAtIndexFromFmsRefs(int index) {
    fmsRefs.removeAt(index);
  }

  void updateFmsRefsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    fmsRefs[index] = updateFn(_fmsRefs[index]);
  }

  void insertAtIndexInFmsRefs(int index, String value) {
    fmsRefs.insert(index, value);
  }

  List<String> _loadRefDvhs = [];
  List<String> get loadRefDvhs => _loadRefDvhs;
  set loadRefDvhs(List<String> value) {
    _loadRefDvhs = value;
  }

  void addToLoadRefDvhs(String value) {
    loadRefDvhs.add(value);
  }

  void removeFromLoadRefDvhs(String value) {
    loadRefDvhs.remove(value);
  }

  void removeAtIndexFromLoadRefDvhs(int index) {
    loadRefDvhs.removeAt(index);
  }

  void updateLoadRefDvhsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    loadRefDvhs[index] = updateFn(_loadRefDvhs[index]);
  }

  void insertAtIndexInLoadRefDvhs(int index, String value) {
    loadRefDvhs.insert(index, value);
  }

  List<String> _intCustoms = [];
  List<String> get intCustoms => _intCustoms;
  set intCustoms(List<String> value) {
    _intCustoms = value;
  }

  void addToIntCustoms(String value) {
    intCustoms.add(value);
  }

  void removeFromIntCustoms(String value) {
    intCustoms.remove(value);
  }

  void removeAtIndexFromIntCustoms(int index) {
    intCustoms.removeAt(index);
  }

  void updateIntCustomsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    intCustoms[index] = updateFn(_intCustoms[index]);
  }

  void insertAtIndexInIntCustoms(int index, String value) {
    intCustoms.insert(index, value);
  }

  List<String> _containers = [];
  List<String> get containers => _containers;
  set containers(List<String> value) {
    _containers = value;
  }

  void addToContainers(String value) {
    containers.add(value);
  }

  void removeFromContainers(String value) {
    containers.remove(value);
  }

  void removeAtIndexFromContainers(int index) {
    containers.removeAt(index);
  }

  void updateContainersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    containers[index] = updateFn(_containers[index]);
  }

  void insertAtIndexInContainers(int index, String value) {
    containers.insert(index, value);
  }

  List<String> _clientsList = [];
  List<String> get clientsList => _clientsList;
  set clientsList(List<String> value) {
    _clientsList = value;
  }

  void addToClientsList(String value) {
    clientsList.add(value);
  }

  void removeFromClientsList(String value) {
    clientsList.remove(value);
  }

  void removeAtIndexFromClientsList(int index) {
    clientsList.removeAt(index);
  }

  void updateClientsListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    clientsList[index] = updateFn(_clientsList[index]);
  }

  void insertAtIndexInClientsList(int index, String value) {
    clientsList.insert(index, value);
  }

  List<String> _warehouseList = [];
  List<String> get warehouseList => _warehouseList;
  set warehouseList(List<String> value) {
    _warehouseList = value;
  }

  void addToWarehouseList(String value) {
    warehouseList.add(value);
  }

  void removeFromWarehouseList(String value) {
    warehouseList.remove(value);
  }

  void removeAtIndexFromWarehouseList(int index) {
    warehouseList.removeAt(index);
  }

  void updateWarehouseListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    warehouseList[index] = updateFn(_warehouseList[index]);
  }

  void insertAtIndexInWarehouseList(int index, String value) {
    warehouseList.insert(index, value);
  }

  List<String> _customList = [];
  List<String> get customList => _customList;
  set customList(List<String> value) {
    _customList = value;
  }

  void addToCustomList(String value) {
    customList.add(value);
  }

  void removeFromCustomList(String value) {
    customList.remove(value);
  }

  void removeAtIndexFromCustomList(int index) {
    customList.removeAt(index);
  }

  void updateCustomListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    customList[index] = updateFn(_customList[index]);
  }

  void insertAtIndexInCustomList(int index, String value) {
    customList.insert(index, value);
  }

  List<String> _goodsList = [];
  List<String> get goodsList => _goodsList;
  set goodsList(List<String> value) {
    _goodsList = value;
  }

  void addToGoodsList(String value) {
    goodsList.add(value);
  }

  void removeFromGoodsList(String value) {
    goodsList.remove(value);
  }

  void removeAtIndexFromGoodsList(int index) {
    goodsList.removeAt(index);
  }

  void updateGoodsListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    goodsList[index] = updateFn(_goodsList[index]);
  }

  void insertAtIndexInGoodsList(int index, String value) {
    goodsList.insert(index, value);
  }

  List<String> _userList = [];
  List<String> get userList => _userList;
  set userList(List<String> value) {
    _userList = value;
  }

  void addToUserList(String value) {
    userList.add(value);
  }

  void removeFromUserList(String value) {
    userList.remove(value);
  }

  void removeAtIndexFromUserList(int index) {
    userList.removeAt(index);
  }

  void updateUserListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userList[index] = updateFn(_userList[index]);
  }

  void insertAtIndexInUserList(int index, String value) {
    userList.insert(index, value);
  }

  List<String> _barcodesList = [];
  List<String> get barcodesList => _barcodesList;
  set barcodesList(List<String> value) {
    _barcodesList = value;
  }

  void addToBarcodesList(String value) {
    barcodesList.add(value);
  }

  void removeFromBarcodesList(String value) {
    barcodesList.remove(value);
  }

  void removeAtIndexFromBarcodesList(int index) {
    barcodesList.removeAt(index);
  }

  void updateBarcodesListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    barcodesList[index] = updateFn(_barcodesList[index]);
  }

  void insertAtIndexInBarcodesList(int index, String value) {
    barcodesList.insert(index, value);
  }

  List<String> _palletPositions = [];
  List<String> get palletPositions => _palletPositions;
  set palletPositions(List<String> value) {
    _palletPositions = value;
  }

  void addToPalletPositions(String value) {
    palletPositions.add(value);
  }

  void removeFromPalletPositions(String value) {
    palletPositions.remove(value);
  }

  void removeAtIndexFromPalletPositions(int index) {
    palletPositions.removeAt(index);
  }

  void updatePalletPositionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    palletPositions[index] = updateFn(_palletPositions[index]);
  }

  void insertAtIndexInPalletPositions(int index, String value) {
    palletPositions.insert(index, value);
  }

  List<UsersTypeStruct> _users = [];
  List<UsersTypeStruct> get users => _users;
  set users(List<UsersTypeStruct> value) {
    _users = value;
  }

  void addToUsers(UsersTypeStruct value) {
    users.add(value);
  }

  void removeFromUsers(UsersTypeStruct value) {
    users.remove(value);
  }

  void removeAtIndexFromUsers(int index) {
    users.removeAt(index);
  }

  void updateUsersAtIndex(
    int index,
    UsersTypeStruct Function(UsersTypeStruct) updateFn,
  ) {
    users[index] = updateFn(_users[index]);
  }

  void insertAtIndexInUsers(int index, UsersTypeStruct value) {
    users.insert(index, value);
  }

  int _rowPerPage = 25;
  int get rowPerPage => _rowPerPage;
  set rowPerPage(int value) {
    _rowPerPage = value;
    prefs.setInt('ff_rowPerPage', value);
  }

  List<SupabaseRowListStruct> _rowList = [];
  List<SupabaseRowListStruct> get rowList => _rowList;
  set rowList(List<SupabaseRowListStruct> value) {
    _rowList = value;
  }

  void addToRowList(SupabaseRowListStruct value) {
    rowList.add(value);
  }

  void removeFromRowList(SupabaseRowListStruct value) {
    rowList.remove(value);
  }

  void removeAtIndexFromRowList(int index) {
    rowList.removeAt(index);
  }

  void updateRowListAtIndex(
    int index,
    SupabaseRowListStruct Function(SupabaseRowListStruct) updateFn,
  ) {
    rowList[index] = updateFn(_rowList[index]);
  }

  void insertAtIndexInRowList(int index, SupabaseRowListStruct value) {
    rowList.insert(index, value);
  }

  List<String> _rowListOfList = [];
  List<String> get rowListOfList => _rowListOfList;
  set rowListOfList(List<String> value) {
    _rowListOfList = value;
  }

  void addToRowListOfList(String value) {
    rowListOfList.add(value);
  }

  void removeFromRowListOfList(String value) {
    rowListOfList.remove(value);
  }

  void removeAtIndexFromRowListOfList(int index) {
    rowListOfList.removeAt(index);
  }

  void updateRowListOfListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    rowListOfList[index] = updateFn(_rowListOfList[index]);
  }

  void insertAtIndexInRowListOfList(int index, String value) {
    rowListOfList.insert(index, value);
  }

  List<String> _packagingList = [];
  List<String> get packagingList => _packagingList;
  set packagingList(List<String> value) {
    _packagingList = value;
  }

  void addToPackagingList(String value) {
    packagingList.add(value);
  }

  void removeFromPackagingList(String value) {
    packagingList.remove(value);
  }

  void removeAtIndexFromPackagingList(int index) {
    packagingList.removeAt(index);
  }

  void updatePackagingListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    packagingList[index] = updateFn(_packagingList[index]);
  }

  void insertAtIndexInPackagingList(int index, String value) {
    packagingList.insert(index, value);
  }

  List<String> _manipulationList = [];
  List<String> get manipulationList => _manipulationList;
  set manipulationList(List<String> value) {
    _manipulationList = value;
  }

  void addToManipulationList(String value) {
    manipulationList.add(value);
  }

  void removeFromManipulationList(String value) {
    manipulationList.remove(value);
  }

  void removeAtIndexFromManipulationList(int index) {
    manipulationList.removeAt(index);
  }

  void updateManipulationListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    manipulationList[index] = updateFn(_manipulationList[index]);
  }

  void insertAtIndexInManipulationList(int index, String value) {
    manipulationList.insert(index, value);
  }

  String _fileUrl = '';
  String get fileUrl => _fileUrl;
  set fileUrl(String value) {
    _fileUrl = value;
  }

  List<OrderWarehouseRowStruct> _orderWarehouseAS = [];
  List<OrderWarehouseRowStruct> get orderWarehouseAS => _orderWarehouseAS;
  set orderWarehouseAS(List<OrderWarehouseRowStruct> value) {
    _orderWarehouseAS = value;
  }

  void addToOrderWarehouseAS(OrderWarehouseRowStruct value) {
    orderWarehouseAS.add(value);
  }

  void removeFromOrderWarehouseAS(OrderWarehouseRowStruct value) {
    orderWarehouseAS.remove(value);
  }

  void removeAtIndexFromOrderWarehouseAS(int index) {
    orderWarehouseAS.removeAt(index);
  }

  void updateOrderWarehouseASAtIndex(
    int index,
    OrderWarehouseRowStruct Function(OrderWarehouseRowStruct) updateFn,
  ) {
    orderWarehouseAS[index] = updateFn(_orderWarehouseAS[index]);
  }

  void insertAtIndexInOrderWarehouseAS(
      int index, OrderWarehouseRowStruct value) {
    orderWarehouseAS.insert(index, value);
  }

  bool _onlineMode = true;
  bool get onlineMode => _onlineMode;
  set onlineMode(bool value) {
    _onlineMode = value;
    prefs.setBool('ff_onlineMode', value);
  }

  String _maxNumRows = '50';
  String get maxNumRows => _maxNumRows;
  set maxNumRows(String value) {
    _maxNumRows = value;
    prefs.setString('ff_maxNumRows', value);
  }

  String _orderWarehouseApiV = 'is_deleted=eq.false';
  String get orderWarehouseApiV => _orderWarehouseApiV;
  set orderWarehouseApiV(String value) {
    _orderWarehouseApiV = value;
  }

  List<GoodDescriptionRowStruct> _goodDescriptionList = [];
  List<GoodDescriptionRowStruct> get goodDescriptionList =>
      _goodDescriptionList;
  set goodDescriptionList(List<GoodDescriptionRowStruct> value) {
    _goodDescriptionList = value;
  }

  void addToGoodDescriptionList(GoodDescriptionRowStruct value) {
    goodDescriptionList.add(value);
  }

  void removeFromGoodDescriptionList(GoodDescriptionRowStruct value) {
    goodDescriptionList.remove(value);
  }

  void removeAtIndexFromGoodDescriptionList(int index) {
    goodDescriptionList.removeAt(index);
  }

  void updateGoodDescriptionListAtIndex(
    int index,
    GoodDescriptionRowStruct Function(GoodDescriptionRowStruct) updateFn,
  ) {
    goodDescriptionList[index] = updateFn(_goodDescriptionList[index]);
  }

  void insertAtIndexInGoodDescriptionList(
      int index, GoodDescriptionRowStruct value) {
    goodDescriptionList.insert(index, value);
  }

  String _goodDescriptionApiV = '';
  String get goodDescriptionApiV => _goodDescriptionApiV;
  set goodDescriptionApiV(String value) {
    _goodDescriptionApiV = value;
  }

  String _goodDescriptionApiId = '';
  String get goodDescriptionApiId => _goodDescriptionApiId;
  set goodDescriptionApiId(String value) {
    _goodDescriptionApiId = value;
  }

  bool _goodDescriptionApiB = false;
  bool get goodDescriptionApiB => _goodDescriptionApiB;
  set goodDescriptionApiB(bool value) {
    _goodDescriptionApiB = value;
  }

  List<ClientRowStruct> _clientList = [];
  List<ClientRowStruct> get clientList => _clientList;
  set clientList(List<ClientRowStruct> value) {
    _clientList = value;
  }

  void addToClientList(ClientRowStruct value) {
    clientList.add(value);
  }

  void removeFromClientList(ClientRowStruct value) {
    clientList.remove(value);
  }

  void removeAtIndexFromClientList(int index) {
    clientList.removeAt(index);
  }

  void updateClientListAtIndex(
    int index,
    ClientRowStruct Function(ClientRowStruct) updateFn,
  ) {
    clientList[index] = updateFn(_clientList[index]);
  }

  void insertAtIndexInClientList(int index, ClientRowStruct value) {
    clientList.insert(index, value);
  }

  bool _clientApiB = false;
  bool get clientApiB => _clientApiB;
  set clientApiB(bool value) {
    _clientApiB = value;
  }

  String _clientApiId = '';
  String get clientApiId => _clientApiId;
  set clientApiId(String value) {
    _clientApiId = value;
  }

  String _clientApiV = '';
  String get clientApiV => _clientApiV;
  set clientApiV(String value) {
    _clientApiV = value;
  }

  List<DetailsViewRowStruct> _detailsViewList = [];
  List<DetailsViewRowStruct> get detailsViewList => _detailsViewList;
  set detailsViewList(List<DetailsViewRowStruct> value) {
    _detailsViewList = value;
  }

  void addToDetailsViewList(DetailsViewRowStruct value) {
    detailsViewList.add(value);
  }

  void removeFromDetailsViewList(DetailsViewRowStruct value) {
    detailsViewList.remove(value);
  }

  void removeAtIndexFromDetailsViewList(int index) {
    detailsViewList.removeAt(index);
  }

  void updateDetailsViewListAtIndex(
    int index,
    DetailsViewRowStruct Function(DetailsViewRowStruct) updateFn,
  ) {
    detailsViewList[index] = updateFn(_detailsViewList[index]);
  }

  void insertAtIndexInDetailsViewList(int index, DetailsViewRowStruct value) {
    detailsViewList.insert(index, value);
  }

  int _updates = 0;
  int get updates => _updates;
  set updates(int value) {
    _updates = value;
  }

  final _clientsManager = FutureRequestManager<List<ClientsRow>>();
  Future<List<ClientsRow>> clients({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ClientsRow>> Function() requestFn,
  }) =>
      _clientsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearClientsCache() => _clientsManager.clear();
  void clearClientsCacheKey(String? uniqueKey) =>
      _clientsManager.clearRequest(uniqueKey);

  final _warehousesManager = FutureRequestManager<List<WarehousesRow>>();
  Future<List<WarehousesRow>> warehouses({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<WarehousesRow>> Function() requestFn,
  }) =>
      _warehousesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearWarehousesCache() => _warehousesManager.clear();
  void clearWarehousesCacheKey(String? uniqueKey) =>
      _warehousesManager.clearRequest(uniqueKey);

  final _customsManager = FutureRequestManager<List<CustomsRow>>();
  Future<List<CustomsRow>> customs({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CustomsRow>> Function() requestFn,
  }) =>
      _customsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCustomsCache() => _customsManager.clear();
  void clearCustomsCacheKey(String? uniqueKey) =>
      _customsManager.clearRequest(uniqueKey);

  final _goodsManager = FutureRequestManager<List<GoodsRow>>();
  Future<List<GoodsRow>> goods({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<GoodsRow>> Function() requestFn,
  }) =>
      _goodsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGoodsCache() => _goodsManager.clear();
  void clearGoodsCacheKey(String? uniqueKey) =>
      _goodsManager.clearRequest(uniqueKey);

  final _goodDescriptionManager =
      FutureRequestManager<List<GoodDescriptionsRow>>();
  Future<List<GoodDescriptionsRow>> goodDescription({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<GoodDescriptionsRow>> Function() requestFn,
  }) =>
      _goodDescriptionManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGoodDescriptionCache() => _goodDescriptionManager.clear();
  void clearGoodDescriptionCacheKey(String? uniqueKey) =>
      _goodDescriptionManager.clearRequest(uniqueKey);

  final _packagingsManager = FutureRequestManager<List<PackagingRow>>();
  Future<List<PackagingRow>> packagings({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PackagingRow>> Function() requestFn,
  }) =>
      _packagingsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPackagingsCache() => _packagingsManager.clear();
  void clearPackagingsCacheKey(String? uniqueKey) =>
      _packagingsManager.clearRequest(uniqueKey);

  final _manipulationsManager = FutureRequestManager<List<ManipulationsRow>>();
  Future<List<ManipulationsRow>> manipulations({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ManipulationsRow>> Function() requestFn,
  }) =>
      _manipulationsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearManipulationsCache() => _manipulationsManager.clear();
  void clearManipulationsCacheKey(String? uniqueKey) =>
      _manipulationsManager.clearRequest(uniqueKey);

  final _loadingGatesManager = FutureRequestManager<List<LoadingGatesRow>>();
  Future<List<LoadingGatesRow>> loadingGates({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<LoadingGatesRow>> Function() requestFn,
  }) =>
      _loadingGatesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLoadingGatesCache() => _loadingGatesManager.clear();
  void clearLoadingGatesCacheKey(String? uniqueKey) =>
      _loadingGatesManager.clearRequest(uniqueKey);

  final _detailsViewManager = FutureRequestManager<List<DetailsViewRow>>();
  Future<List<DetailsViewRow>> detailsView({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<DetailsViewRow>> Function() requestFn,
  }) =>
      _detailsViewManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDetailsViewCache() => _detailsViewManager.clear();
  void clearDetailsViewCacheKey(String? uniqueKey) =>
      _detailsViewManager.clearRequest(uniqueKey);

  final _warehousePositionsManager =
      FutureRequestManager<List<WarehousePositionsRow>>();
  Future<List<WarehousePositionsRow>> warehousePositions({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<WarehousePositionsRow>> Function() requestFn,
  }) =>
      _warehousePositionsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearWarehousePositionsCache() => _warehousePositionsManager.clear();
  void clearWarehousePositionsCacheKey(String? uniqueKey) =>
      _warehousePositionsManager.clearRequest(uniqueKey);

  final _users2Manager = FutureRequestManager<List<UsersRow>>();
  Future<List<UsersRow>> users2({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRow>> Function() requestFn,
  }) =>
      _users2Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUsers2Cache() => _users2Manager.clear();
  void clearUsers2CacheKey(String? uniqueKey) =>
      _users2Manager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
