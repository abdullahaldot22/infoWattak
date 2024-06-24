import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import {Head, Link} from '@inertiajs/react';
import '@/../css/customTable.css';
import {useState} from "react";

export default function Dashboard({ auth, products, trashed }) {

    function date (data) {
        let myDate = new Date(data).toLocaleString(
            "en-US",
            {
                month: "short",
                day: "2-digit",
                year: "numeric",
                hour: "numeric",
                hour12: true,
                minute: "numeric",
            }
        );
        return myDate;
    }


    return (
        <AuthenticatedLayout
            user={auth.user}
            header={<h2 className="font-semibold text-xl text-gray-800 leading-tight">Products</h2>}
        >
            <Head title="Laravel | Products"/>

            <div className="py-12">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div className="p-6 text-gray-900">
                            <div className="flex flex-nowrap items-center justify-between pb-3">
                                <h2 className="text-xl mb-3 font-bold">All Products</h2>
                                <Link className="bg-gray-900 text-white px-3 py-1.5 rounded m-1" href={route('products.create')}>Add Product</Link>
                            </div>
                            <table className="w-full text-left">
                                <thead>
                                <tr>
                                    <th>Sl</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Stock</th>
                                    <th>Created At</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                {
                                    products.map(
                                        (product, index) => (
                                            <tr>
                                                <td>{index + 1}</td>
                                                <td>{product.name}</td>
                                                <td>{product.description}</td>
                                                <td>{product.price}</td>
                                                <td>{product.stock}</td>
                                                <td>{date(product.created_at)}</td>
                                                <td className="text-center">
                                                    <Link
                                                        className="bg-gray-600 text-white px-2 py-1 rounded m-1"
                                                        href={route('products.edit', {id: product.id})}
                                                    >Edit
                                                    </Link>
                                                    <br/>
                                                    <br/>
                                                    <Link
                                                        className="bg-red-400 text-white px-2 py-1 rounded m-1"
                                                        href={route('products.delete', {id: product.id})}
                                                    >Delete
                                                    </Link>
                                                </td>
                                            </tr>
                                        )
                                    )
                                }
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div className="py-12">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div className="p-6 text-gray-900">
                            <h2 className="text-xl mb-3 font-bold pb-2">Deleted Products</h2>
                            <table className="w-full text-left">
                                <thead>
                                <tr>
                                    <th>Sl</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Stock</th>
                                    <th>Deleted At</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                {
                                    trashed.map(
                                        (trash, index) => (
                                            <tr>
                                                <td>{index + 1}</td>
                                                <td>{trash.name}</td>
                                                <td>{trash.description}</td>
                                                <td>{trash.price}</td>
                                                <td>{trash.stock}</td>
                                                <td>{date(trash.deleted_at)}</td>
                                                <td className="text-center">
                                                    <Link
                                                        className="bg-gray-600 text-white px-2 py-1 rounded m-1"
                                                        href={route('products.restore', {id: trash.id})}
                                                    >Restore
                                                    </Link>
                                                    <br/>
                                                    <br/>
                                                    <Link
                                                        className="bg-red-400 text-white px-2 py-1 rounded m-1"
                                                        href={route('products.destroy', {id: trash.id})}
                                                    >Remove
                                                    </Link>
                                                </td>
                                            </tr>
                                        )
                                    )
                                }
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </AuthenticatedLayout>
    );
}
