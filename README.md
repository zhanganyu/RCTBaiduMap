# RCTBaiduMap
react-native support for BaiduMap on iOS

导入方式:
1.首先添加baidumap的framework至工程中，建议使用pods :

pod 'BaiduMapKit' #百度地图SDK

2.appDelegate 加入以下启动代码:
_mapManager = [[BMKMapManager alloc] init];
 [_mapManager start:@"你的百度地图appKey" generalDelegate:self];

3.复制xcode-files-to-add中的文件至工程中 并添加至target

使用方式:
var MapView = require('./react-native-bmkmap-ios/BMKMapView');

.....

	_fetchShop() {
		//获取周边网点
		fetch(Config.SERVER_ROOT+"/m/shop.do",{ method: 'POST', body: Utils.toParam({ 
	        type: 2,
			action:'getShop',
	    }) })
	    .then((response) => response.json())
	    .then((responseData) => {
	    		//获取你的标注点信息，格式目前必须是这样:
	    		/*
	    		{
	    			name:string,
	    			title:string,
	    			subTittle:string,
	    			picture:string(image url),
	    			longitude:number,
	    			latitude:number

	    		}
	    		*/
	    }).done();
	},
	_onLocated(e) {
		this.setState({isUpdating:false});
		//定位后的坐标数据在e中
		console.log(e);
	},
	render(){
		return <MapView
				overlays = {this.state.shopList}
				showsUserLocation = {true}
				isUpdating = {this.state.isUpdating}
				onLocated = {this._onLocated}
				style={{flex:1}}/>
	},


MapView可以接受的属性

//是否开启定位模式
	isUpdating: React.PropTypes.bool,
	//是否显示用户位置
	showsUserLocation: React.PropTypes.bool,
	/*定位成功の回调 callback 格式:
	* {
	*	 coords:{
	* 			longitude:double
	* 			latitude:double
	* 		}
	* }
	* 
	*/
	onLocated: React.PropTypes.func,
	//覆盖物数组
	overlays: React.PropTypes.array,