class pair{
  double? x;
  double? y;
  pair({required this.x,required this.y});
}



pair gps_alaram(String name) {
  Map<String, pair>umap ={};

  umap['Nangloi']?.x=28.682346283051263;
  umap['Nangloi']?.x=77.06480829604679;


  double? x=umap['Nangloi']?.x;
  double? y=umap['Nangloi']?.y;
  print(x);
  print(y);

  pair ans={x,y} as pair;

  return ans;
}