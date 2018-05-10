// @flow
import React from 'react';
import {
    StyleSheet,
    Text,
    View,
} from 'react-native';

const xValues = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
const yValues = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0];

const App = () => (
    <View style={styles.container}>
        <View style={styles.navigation}>
            <Text style={styles.navigationText}>Navigation Bar</Text>
        </View>
    </View>
);

const styles = StyleSheet.create({
    container: {
        paddingTop: 20,
        display: 'flex',
        justifyContent: 'center',
        backgroundColor: '#F5FCFF',
        alignItems: 'stretch',
        flexDirection: 'column',
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
    },
});

export default App;
