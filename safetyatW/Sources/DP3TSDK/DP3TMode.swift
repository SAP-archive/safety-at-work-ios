/*
 * Created by Ubique Innovation AG
 * https://www.ubique.ch
 * Copyright (c) 2020. All rights reserved.
 */

/// This is used to differentiate between production and calibration mode
public enum DP3TMode: Equatable {
    case production

        case calibration(identifierPrefix: String, appVersion: String)
 

    static var current: DP3TMode = .production
}
