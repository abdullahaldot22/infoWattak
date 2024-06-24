<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::all()->sortBy('name')->values()->all();
        $trashed = Product::onlyTrashed()->get()->sortBy('name')->values()->all();
        return Inertia::render('Products/Index', [
            'products' => $products,
            'trashed' => $trashed,
        ]);
    }

    public function create()
    {
        return Inertia::render('Products/Create');
    }

    public function store(Request $request)
    {
//        dd($request->all());
        $request->validate([
            'name' => 'required|unique:products,name',
            'price' => 'required|numeric|min:0',
            'stock' => 'required|numeric|min:0',
            'description' => 'required',
        ]);

        Product::create([
            'name' => $request->name,
            'price' => $request->price,
            'stock' => $request->stock,
            'description' => $request->description,
        ]);
        return redirect()->route('products');
    }

    public function edit($id)
    {
        $product = Product::find($id);
        return Inertia::render('Products/Edit', compact('product'));
    }

    public function update(Request $request)
    {
//        dd($request->all());
        $request->validate([
            'name' => 'required',
            'price' => 'required|numeric|min:0',
            'stock' => 'required|numeric|min:0',
            'description' => 'required',
        ]);

        Product::find($request->id)->update([
            'name' => $request->name,
            'price' => $request->price,
            'stock' => $request->stock,
            'description' => $request->description,
        ]);
        return redirect()->route('products');
    }

    public function delete($id)
    {
        Product::find($id)->delete();
        return redirect()->route('products');
    }

    public function restore($id)
    {
        Product::withTrashed()->findOrFail($id)->restore();
        return redirect()->route('products');

    }

    public function destroy(string $id)
    {
        Product::withTrashed()->findOrFail($id)->forceDelete();
        return redirect()->route('products');
    }
}
