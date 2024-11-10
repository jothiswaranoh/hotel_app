import { StrictMode, Suspense, lazy } from 'react';
import { createRoot } from 'react-dom/client';
import './index.css';
import 'ag-grid-community/styles/ag-grid.css';
import 'ag-grid-community/styles/ag-theme-quartz.css';
import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import ErrorPage from './error-page';
const Dashboard = lazy(() => import('./pages/Dashboard'));
const Users = lazy(() => import('./pages/Users'));
const Products = lazy(() => import('./pages/Products'));
const OrdersList = lazy(() => import('./pages/OrdersList'));
const Categories = lazy(() => import('./pages/Categories'));
const TablesPage = lazy(() => import('./pages/TablesPage'));
// const Login = lazy(() => import('./pages/Login'));

const router = createBrowserRouter([
  {
    path: '/',
    element: <Dashboard />,
    errorElement: <ErrorPage />,
  },
  {
    path: '/users',
    element: <Users />,
    errorElement: <ErrorPage />,
  },
  {
    path: '/foods',
    element: <Products />,
    errorElement: <ErrorPage />,
  },
  {
    path: '/tables',
    element: <TablesPage />,
    errorElement: <ErrorPage />,
  },
  {
    path: '/categories',
    element: <Categories />,
    errorElement: <ErrorPage />,
  },
  {
    path: '/orders_list',
    element: <OrdersList />,
    errorElement: <ErrorPage />,
  },
  {
    path: '/login',
    element: (
      <Suspense fallback={<div>Loading...</div>}>{/* <Login /> */}</Suspense>
    ),
    errorElement: <ErrorPage />,
  },
]);

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <Suspense fallback={<div>Loading...</div>}>
      <RouterProvider router={router} />
    </Suspense>
  </StrictMode>
);
