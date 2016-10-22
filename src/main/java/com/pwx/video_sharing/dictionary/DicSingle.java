package com.pwx.video_sharing.dictionary;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.apache.log4j.Logger;

import com.pwx.video_sharing.dictionary.entity.DataDictionary;
import com.pwx.video_sharing.dictionary.service.IDicService;


/**
 * 
 * <全局数据字典>
 * 
 * @version 
 * <pre>
 * Author	Version		Date		Changes
 * tanchao 	1.0  		2015年6月13日 	Created
 *
 * </pre>
 * @since 1.
 */


public final class DicSingle implements Map<String, List<DataDictionary>>
{
	private static DicSingle dicSingle = new DicSingle();

	private final static Logger log = Logger.getLogger(DicSingle.class);

	private static Map<String, List<DataDictionary>> map;
	
	
	
    public static Map<String, List<DataDictionary>> getMap() {
        return map;
    }
    
    public static void setMap(Map<String, List<DataDictionary>> map) {
        DicSingle.map = map;
    }

    private static IDicService dicServices = null;

	
	private DicSingle()
    {
	    
    }
    public DicSingle(IDicService dicService)
	{
		try
		{
		    dicServices = dicService;
			map = new HashMap<String, List<DataDictionary>>();
			instanceInit();
		} catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new RuntimeException(this.getClass().getName() + " data load fail.");
		}
	}

	public static DicSingle getInstance()
	{
	    
        return dicSingle;
//        return null;
	}

	private List<DataDictionary> loadData()
	{
		return dicServices.getList();
	}

	public void instanceInit()
	{
		try
		{
			long start = System.currentTimeMillis();

			// 从数据库数据字典中加载数据字典
			// 将数据字典解析,以pname为key,value为整个对象
			List<DataDictionary> dataDictionaries = loadData();

			// pname分组
			Set<String> set = new TreeSet<String>();
			for (DataDictionary dictionary : dataDictionaries)
			{
				if (dictionary.getPname() != null)
				{
					set.add(dictionary.getPname());
				}
			}

			Iterator<String> iterator = set.iterator();
			// 循环将每组分类.
			while (iterator.hasNext())
			{
				String type = iterator.next();
				List<DataDictionary> list = new ArrayList<DataDictionary>();
				for (DataDictionary dictionary : dataDictionaries)
				{
					if (dictionary.getPname().equals(type))
					{
						list.add(dictionary);
					}
				}
				map.put(type, list);
			}
			long end = System.currentTimeMillis();

			log.info(" data load finish.");
			log.info(" data total size:" + dataDictionaries.size());
			log.info(" data group size:" + map.size());
			log.info(String.format(" runtime %s ms:", end - start));
		} catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new RuntimeException(DicSingle.class.getSimpleName() + " data load fail.");
		}
	}

	/**
	 * 
	 * 功 能 ：重置数据字典
	 * 
	 * @throws Exception
	 */
	public void doReset() throws Exception
	{
		synchronized (map)
		{
			map = new HashMap<String, List<DataDictionary>>();
			instanceInit();
		}
	}

	@Override
	public void clear()
	{
		map.clear();
	}

	@Override
	public boolean containsKey(Object key)
	{
		return map.containsKey(key);
	}

	@Override
	public boolean containsValue(Object value)
	{
		return map.containsValue(value);
	}

	@Override
	public Set<java.util.Map.Entry<String, List<DataDictionary>>> entrySet()
	{
		return map.entrySet();
	}

	public DataDictionary get(Object key, String realValue)
	{
		DataDictionary result = null;
		List<DataDictionary> list = map.get(key);
		for (DataDictionary dictionary : list)
		{
			if (dictionary.getRealvalue().equals(realValue))
			{
				result = dictionary;
				break;
			}
		}
		return result;
	}

	public String getText(Object key, String realValue)
	{
		String text = null;
		List<DataDictionary> list = map.get(key);
		for (DataDictionary dictionary : list)
		{
			if (dictionary.getRealvalue().equals(realValue))
			{
				text = dictionary.getText();
				break;
			}
		}
		return text;
	}

	public DataDictionary getByText(Object key, String text)
	{
		DataDictionary result = null;
		List<DataDictionary> list = map.get(key);
		for (DataDictionary dictionary : list)
		{
			if (dictionary.getText().equals(text))
			{
				result = dictionary;
				break;
			}
		}
		return result;
	}

	public List<DataDictionary> get(Object key)
	{
		return map.get(key);
	}
	
	public static List<DataDictionary> getObject(Object key)
    {
        return map.get(key);
    }

	@Override
	public boolean isEmpty()
	{
		return map.isEmpty();
	}

	@Override
	public Set<String> keySet()
	{
		return map.keySet();
	}

	@Override
	public void putAll(Map<? extends String, ? extends List<DataDictionary>> m)
	{
		map.putAll(m);
	}

	@Override
	public List<DataDictionary> remove(Object key)
	{
		return map.remove(key);
	}

	@Override
	public int size()
	{
		return map.size();
	}

	@Override
	public Collection<List<DataDictionary>> values()
	{
		return map.values();
	}

	@Override
	public List<DataDictionary> put(String key, List<DataDictionary> value)
	{
		return map.put(key, value);
	}

}
