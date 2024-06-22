<?php

namespace App\Http\Controllers;

use App\Models\Izin;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VerifikatorController extends Controller
{
    public function verifyOrdinaryUser($id)
    {
        $users = User::findOrFail($id);
        $users->status = 'verified';
        $users->save();

        return response()->json([
            'message' => 'user verified successfully'
        ], 200);
    }

    public function accIzin(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|in:approved,rejected',
            'verifikator_comment' => 'required|string',
            'verifikator_id' => 'required|exists:users,id',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $izins = Izin::findOrFail($id);
        $izins->status = $request->status;
        $izins->verifikator_comment = $request->verifikator_comment;
        $izins->verifikator_id = $request->id;
        $izins->save();

        return response()->json([
            'message' => 'izin approved'
        ], 200);
    }

    public function rejectIzin(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|in:approved,rejected',
            'verifikator_comment' => 'required|string',
            'verifikator_id' => 'required|exists:users,id',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $izins = Izin::findOrFail($id);
        $izins->status = $request->status;
        $izins->verifikator_comment = $request->verifikator_comment;
        $izins->verifikator_id = $request->id;
        $izins->save();

        return response()->json([
            'message' => 'izin rejected'
        ], 200);
    }

    // public function getPendingIzin()
    // {
    //     $izins = Izin::where('status', 'pending')->get();
    //     return response()->json($izins);
    // }

    // public function getApprovedIzin()
    // {
    //     $izins = Izin::where('status', 'approved')->get();
    //     return response()->json($izins);
    // }

    // public function getRejectedIzin()
    // {
    //     $izins = Izin::where('status', 'rejected')->get();
    //     return response()->json($izins);
    // }
}
