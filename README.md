# RCTBaiduMap
react-native support for BaiduMap on iOS



使用方式:
var MapView = require('./components/BMKMapView');

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
	_onLocated() {
		this.setState({isUpdating:false});
	},
	render(){
		return <MapView
				overlays = {this.state.shopList}
				showsUserLocation = {true}
				isUpdating = {this.state.isUpdating}
				onLocated = {this._onLocated}
				style={{flex:1}}/>
	},