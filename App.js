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
import MapView from './MapView';

type Props = {};

export default class App extends Component<Props> {
	render() {
		return (
			<View style={styles.container}>
				<View style={styles.navigation}>
					<Text style={styles.navigationText}>Navigation Bar</Text>
				</View>
				<MapView style={styles.map} />
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
