import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import {Head, router} from '@inertiajs/react';
import InputLabel from "@/Components/InputLabel";
import TextInput from "@/Components/TextInput";
import InputError from "@/Components/InputError";
import PrimaryButton from '@/Components/PrimaryButton';
import { Link, useForm, usePage } from '@inertiajs/react';
import {useState} from "react";

export default function Dashboard({ auth }) {

    const { data, setData, success, errors, post } = useForm({
        name: "",
        stock: "",
        price: "",
        description: "",
    });

    const submit = (e) => {
        e.preventDefault();
        post(route('products.store'));
    };

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={<h2 className="font-semibold text-xl text-gray-800 leading-tight">Create Product</h2>}
        >
            <Head title="Laravel | Create Product" />

            <div className="py-12">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div className="p-6 text-gray-900">Create Product</div>

                        <div className="p-8 pt-2">
                        <form onSubmit={submit} method="post">
                                <div className="mb-3 w-1/2 float-start px-3">
                                    <InputLabel htmlFor="name" value="Name"/>

                                    <TextInput
                                        id="name"
                                        className="mt-1 block w-full"
                                        value={data.name}
                                        onChange={(e) => setData("name",e.target.value)}
                                        required
                                        autoComplete="name"
                                    />

                                    <InputError className="mt-2" message={errors.name}/>
                                </div>

                                <div className="mb-3 w-1/2 float-end px-3">
                                    <InputLabel htmlFor="name" value="Stock"/>

                                    <TextInput
                                        id="stock"
                                        className="mt-1 block w-full"
                                        value={data.stock}
                                        onChange={(e) => setData("stock", e.target.value)}
                                        required
                                        autoComplete="stock"
                                    />

                                    <InputError className="mt-2" message={errors.stock}/>
                                </div>

                                <div className="mb-3 w-1/2 px-3">
                                    <InputLabel htmlFor="name" value="Price"/>

                                    <TextInput
                                        id="price"
                                        className="mt-1 block w-full"
                                        value={data.price}
                                        onChange={(e) => setData("price", e.target.value)}
                                        required
                                        autoComplete="price"
                                    />

                                    <InputError className="mt-2" message={errors.price}/>
                                </div>

                                <div className="px-3">
                                    <InputLabel htmlFor="name" value="Description"/>
                                    <textarea id="description" className="border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm w-full" value={data.description} rows="5" onChange={e => setData("description", e.target.value)}/>
                                    <InputError className="mt-2" message={errors.description}/>
                                </div>

                                <div className="mt-6 flex items-center gap-4">
                                    <PrimaryButton className="w-full justify-center" disabled="">Add Product</PrimaryButton>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
