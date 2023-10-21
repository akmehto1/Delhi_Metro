import 'package:metro_oct/GraphBuild/Station_class.dart';

Map<dynamic,int>?Metro_Address(){
  List<Station>StationList=parseJsonToStationList();
  int  size=StationList.length;
  Map<String, int> ans = {};
  for(int i=0;i<size;i++){
      String name=StationList[i].name;
      ans[name]=i;
  }

  return ans;
}