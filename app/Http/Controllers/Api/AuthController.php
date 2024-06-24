<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function register (Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required',
            'c_password' => 'required|same:password',
        ]);
        if ( $validate->fails() )
        {
            $response = [
                'success' => [
                    'status' => false,
                    'request' => $request->all(),
                ],
                'message' => $validate->errors(),
            ];
            return response()->json($response, 400);
        } else {
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);

            try {
                $response = [
                    'success' => [
                        'token' => $user->createToken($request->email)->plainTextToken,
                        'status' => true,
                        'user' => $user->name,
                    ],
                    'message' => 'User created & logged into user successfully',
                ];
                return response()->json($response, 200);
            } catch (Throwable $e) {
                $response = [
                    'success' => [
                        'status' => false,
                        'request' => $request->all(),
                    ],
                    'message' => $e->getMessage(),
                ];
                return response()->json($response, 400);
            }
        }
    }

    public function login (Request $request) {
        $validate = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ( $validate->fails() )
        {
            $response = [
                'success' => [
                    'status' => false,
                    'request' => $request->all(),
                ],
                'message' => $validate->errors(),
            ];
            return response()->json($response, 400);

        } else {
            try {
                $user = User::where('email', $request->email)->first();
                if(!empty($user) && Hash::check($request->password, $user->password))
                {
                    $response = [
                        'success' => [
                            'token' => $user->createToken($request->email)->plainTextToken,
                            'status' => true,
                            'user' => $user->name,
                        ],
                        'message' => 'User Logged in successfully',
                    ];
                    return response()->json($response, 200);
                }
            } catch (Throwable $e) {
                $response = [
                    'success' => [
                        'status' => false,
                        'request' => $request->all(),
                    ],
                    'message' => $e->getMessage(),
                ];
                return response()->json($response, 400);
            }
        }
    }

    public function logout (Request $request)
    {
        try {
            auth('sanctum')->user()->currentAccessToken()->delete();
            $response = [
                'success' => [
                    'status' => true,
                ],
                'message' => 'User Logged out successfully',
            ];
            return response()->json($response, 200);
        }
        catch (Throwable $exception)
        {
            $response = [
                'success' => [
                    'status' => false,
                ],
                'message' => $exception->getMessage(),
            ];
            return response()->json($response, 400);
        }
    }
}
