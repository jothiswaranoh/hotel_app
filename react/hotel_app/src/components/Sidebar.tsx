import { navItems } from '@/lib/navItems'
import { NavLink } from 'react-router-dom';

const Sidebar = () => {

  return (
    <div className='p-4 '>
      <div className='pb-4 px-4 text-2xl text-[#2c7189c8]'>Admin Panel</div>
      <ul className='flex flex-col mt-4'>
        {navItems.map((navItem) => {
          return (
            <NavLink
              to={navItem.path}
              className={({ isActive, isPending }) =>
                `text-[#5db7d4c8] border-2 rounded-2xl py-2 my-1 border-transparent px-4 hover:bg-[#d3f1fbc8] hover:border-b-2 ${
                  isActive
                    ? 'bg-[#d3f1fbba] border-b-2 text-[#06526bc8]'
                    : isPending
                    ? 'pending'
                    : ''
                }`
              }
            >
              {navItem.title}
            </NavLink>
          );
        })}
      </ul>
    </div>
  );
}

export default Sidebar