import { increase, decrease } from "../actions/viewsAction";

// 기본데이터
const count = 1;
// reducer 생성
const viewReducer = (state = count, action) => {
    switch(action.type) {
        // action === '각 액션'일 경우
        case "INCREASE":
        return state + 1;

        case "DECREASE":
        return state - 1;

        case "SET_NUMBER":
        return action.payload;

        default:
        return state;
    }
}

export default viewReducer;