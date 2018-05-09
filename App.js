/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
	Platform,
	StyleSheet,
	Text,
	View
} from 'react-native';
import ChartView from './ChartView';

type Props = {};

export default class App extends Component<Props> {
	render() {
		return (
			<View style={styles.container}>
				<View style={styles.navigation}>
					<Text style={styles.navigationText}>Navigation Bar</Text>
				</View>
				<ChartView
					xValues={["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]}
					yValues={[20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]}
					style={styles.map}
				/>
			</View>
		);
	}
}

const styles = StyleSheet.create({
	container: {
		paddingTop: 20,
		display: 'flex',
		justifyContent: 'center',
		alignItems: 'center',
		backgroundColor: '#F5FCFF',
		alignItems: 'stretch',
		flexDirection: 'column',
		flex: 1,
	},
	map: {
		flex: 1,
	},
	navigation: {
		paddingLeft: 8,
		paddingRight: 8,
		backgroundColor: 'black',
		height: 40,
		justifyContent: 'center',
	},
	navigationText: {
		color: 'white',
	}
});
