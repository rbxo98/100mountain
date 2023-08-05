import { combineReducers } from "redux"; //리듀서를 모두 합치는데 사용한다.
import viewReducer from "./noticeReducer.js";

const rootReducer = combineReducers({
    viewReducer
});

export default rootReducer;