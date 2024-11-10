import React, { lazy } from 'react';
const Navbar = lazy(() => import('@/components/Navbar'));
const Sidebar = lazy(() => import('@/components/Sidebar'));

const BaseLayout = ({ children }: { children: React.ReactNode }) => {
  return (
    <div className='flex h-[100dvh] bg-[#d3f1fbba]'>
      <div className='basis-1/6 card m-3'>
        <Sidebar />
      </div>
      <div className='flex flex-col gap-2 basis-5/6 my-3 mr-3'>
        <div className='basis-1/12 card'>
          <Navbar />
        </div>
        <div className='basis-11/12 card'>{children}</div>
      </div>
    </div>
  );
};

export default BaseLayout;
