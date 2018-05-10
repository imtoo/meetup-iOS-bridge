// @flow
import PropTypes from 'prop-types';
import React, { Component } from 'react';
import { NativeEventEmitter, NativeModules, requireNativeComponent } from 'react-native';

const { PeriodicalDataManager } = NativeModules;

const eventEmitter = new NativeEventEmitter(PeriodicalDataManager);

type Props = {|
	+xValues: string[],
	+yValues: number[],
|};

class ChartView extends Component<Props> {

    componentDidMount() {
        eventEmitter.addListener('PeriodicalData', (data: any) => console.log('it is there!', data))
    }

    render() {
        const { xValues, yValues } = this.props;

        return (
            <Chart
                xValues={xValues}
                yValues={yValues}
                style={{ flex: 1}}
            />
        );
    }
}

const MODULE_NAME = 'Chart'; // it's always looking for *Manager
const Chart = requireNativeComponent(MODULE_NAME, null);

export default ChartView;
