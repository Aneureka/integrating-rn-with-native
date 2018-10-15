import { NativeModules, NativeEventEmitter, Platform } from 'react-native';
const { RNWithNative } = NativeModules;

type RNWithNativeModule = {
  language: string,
  languages: Array<string>
};

export const language: string = RNWithNative.language;
export const languages: string[] = RNWithNative.languages;

let Module: RNWithNativeModule = {
  language: RNWithNative.language,
  languages: RNWithNative.languages,
};

export default Module;
