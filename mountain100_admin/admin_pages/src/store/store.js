import { createStore } from "redux";
import rootReducer from "../reducers/reducers";

const store = createStore(rootReducer); //저장공간인 store 만들기

export default store;