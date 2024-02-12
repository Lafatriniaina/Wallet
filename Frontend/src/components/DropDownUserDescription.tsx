import React from 'react';
import { RiArrowDropDownLine } from "react-icons/ri";
import type { MenuProps } from 'antd';
import { Dropdown, Space } from 'antd';
import profil from '../assets/profil.jpg';

const items: MenuProps['items'] = [
  {
    key: '1',
    label: (
      <a target="_blank" rel="noopener noreferrer" href="https://www.antgroup.com">
        1st menu item
      </a>
    ),
  },
  {
    key: '2',
    label: (
        <a target="_blank" rel="noopener noreferrer" href="https://www.antgroup.com">
        1st menu item
      </a>
    ),
  },
  {
    key: '3',
    label: (
      <a target="_blank" rel="noopener noreferrer" href="https://www.luohanacademy.com">
        3rd menu item 
      </a>
    ),
  },
  {
    key: '4',
    label: (
        <a target="_blank" rel="noopener noreferrer" href="https://www.luohanacademy.com">
          3rd menu item 
        </a>
    ),
  },
];

const DropDownUserMenu: React.FC = () => (
  <Dropdown menu={{ items }}>
    <a onClick={(e) => e.preventDefault()} className="flex justify-between w-[55px] h-[45px]">
        <img src={profil} alt="profile" className="w-[45px] h-[45px] rounded-full" />
        <Space>
            <RiArrowDropDownLine size={35} className="font-bold" />
        </Space>
    </a>
  </Dropdown>
);

export default DropDownUserMenu;