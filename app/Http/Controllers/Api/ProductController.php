<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Product;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $columns = ['id', 'name', 'description', 'price', 'stock', 'created_at'];
        $products = Product::all($columns);
        return response()->json($products);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:32000',
            'price' => 'required|numeric|min:0',
            'stock' => 'required|numeric|min:0',
        ]);
        if ($validated->fails()) {
            return response()->json($validated->errors(), 400);
        }

        $product = new Product();
        $product->fill($request->all());
        $product->save();

        return response()->json([
            'message' => 'Product created successfully.',
        ], 400);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $product = Product::findOrFail($id);
        if (!$product) {
            return response()->json(['message' => 'Product not found.'], 404);
        }
        return response()->json($product);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $validated = Validator::make($request->all(), [
            'id' => 'required|integer|exists:products,id',
            'name' => 'required|string|max:255',
            'description' => 'required|string|max:32000',
            'price' => 'required|numeric|min:0',
            'stock' => 'required|numeric|min:0',
        ]);
        if ($validated->fails()) {
            return response()->json($validated->errors(), 400);
        }

        Product::find($request->id)->update($request->all());

        return response()->json([
            'message' => 'Product updated successfully.',
        ], 400);
    }

    public function delete(string $id)
    {
        Product::findOrFail($id)->delete();
        return response()->json([
            'message' => 'Product deleted successfully.',
        ]);
    }

    public function deleted() : JsonResponse
    {
        $products = Product::onlyTrashed()->get();
        return response()->json($products);
    }

    public function restore(string $id)
    {
        Product::withTrashed()->findOrFail($id)->restore();
        return response()->json([
            'message' => 'Product restored successfully.',
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Product::withTrashed()->findOrFail($id)->forceDelete();
        return response()->json([
            'message' => 'Product permanently deleted successfully.',
        ]);
    }
}
