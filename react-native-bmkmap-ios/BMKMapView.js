// BMKMapView.js
var React = require('react-native');
var { 
	requireNativeComponent,
	Component,
} = React;

var BMMap = requireNativeComponent('RCTBaiduMapView', MapView);
//var BMMap = React.NativeModules.RCTBaiduMapView;


class MapView extends React.Component {

  render() {
    return <BMMap ref='map' {...this.props} />;
  }
}

MapView.propTypes = {
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
}

module.exports = MapView;