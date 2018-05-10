// @flow
import PropTypes from 'prop-types';
import React, { Component } from 'react';
import { NativeEventEmitter, NativeModules, requireNativeComponent } from 'react-native';

const { NotificationCenterDataManager } = NativeModules;

const NCEventEmitter = new NativeEventEmitter(NotificationCenterDataManager);
const NCEventName = 'NCPeriodicalData'

type Props = {|
	+xValues: string[],
	+yValues: number[],
|};

class ChartView extends Component<Props> {

    componentDidMount() {
        NCEventEmitter.addListener(NCEventName, this.handleNCEvent.bind(this))
    }

    componentWillUnmount() {
        NCEventEmitter.removeListener(NCEventName, this.handleNCEvent.bind(this))
    }

    handleNCEvent(data: any) {
        console.log('NC data: ', data)
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
